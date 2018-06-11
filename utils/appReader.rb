require_relative '../model/book'
require_relative '../model/author'
require_relative '../model/reader'
require_relative '../model/order'

class AppReader
  FILES = {
    authors: 'data/authors.txt',
    books: 'data/books.txt',
    readers: 'data/readers.txt',
    orders: 'data/orders.txt'
  }.freeze

  def initialize(library)
    @library = library
    read_all_files
  end

  def self.exist_files?
    hash_with_file_paths = FILES.values
    hash_with_file_paths.all? { |path| File.file?(path) }
  end

  private

  def read_all_files
    FILES.each do |key, path|
      File.open(path, 'r') do |data_set|
        data_set.each_line do |line|
          read_lines_by_key(key, line)
        end
      end
    end
  end

  def read_lines_by_key(key, line)
    case key
    when :authors then read_authors(line)
    when :books then read_books(line)
    when :readers then read_readers(line)
    when :orders then read_orders(line)
    end
  end

  def read_authors(line)
    data = array_from_string(line)
    author = Author.new(data[0], data[1].chomp)
    @library.authors.push(author)
  end

  def read_books(line)
    data = array_from_string(line)
    book_author = @library.authors.select { |v| v.name_author.chomp == data[1].chomp }.first
    book = Book.new(data[0], book_author)
    @library.books.push(book)
  end

  def read_readers(line)
    data = array_from_string(line)
    reader = Reader.new(data[0], data[1], data[2], data[3], data[4].chomp)
    @library.readers.push(reader)
  end

  def read_orders(line)
    data = array_from_string(line)
    book = find_book(data[0])
    reader = find_reader(data[1])
    @library.orders.push(Order.new(book, reader, data[2].chomp))
  end

  def find_book(book)
    @library.books.select { |v| v.name_book == book }.first
  end

  def find_reader(reader)
    @library.readers.select { |v| v.name_reader == reader }.first
  end

  def array_from_string(line)
    line.split(';')
  end
end
