require_relative '../model/book'
require_relative '../model/author'
require_relative '../model/reader'
require_relative '../model/order'

class AppReader
  FILE_AUTHORS = 'data/authors.txt'.freeze
  FILE_BOOKS = 'data/books.txt'.freeze
  FILE_READERS = 'data/readers.txt'.freeze
  FILE_ORDERS = 'data/orders.txt'.freeze

  def initialize(library)
    @library = library
    library.arr_authors = file_reads(FILE_AUTHORS, 'authors')
    library.arr_books = file_reads(FILE_BOOKS, 'books')
    library.arr_readers = file_reads(FILE_READERS, 'readers')
    library.arr_orders = file_reads(FILE_ORDERS, 'orders')
  end

  def self.exist_files?
    if File.file?(FILE_AUTHORS) && File.file?(FILE_BOOKS) &&
       File.file?(FILE_READERS) && File.file?(FILE_ORDERS)
      return true
    end
    false
  end

  private

  def file_reads(file, name)
    arrays = []
    data_set = File.open(file, 'r')
    data_set.each do |line|
      data = line.split(';')
      case name
      when 'authors'
        author = Author.new(data[0], data[1].chomp)
        arrays.push(author)
      when 'books'
        b_author = @library.arr_authors.select { |v| v.name_author.chomp == data[1].chomp }.first
        book = Book.new(data[0], b_author)
        arrays.push(book)
      when 'readers'
        reader = Reader.new(data[0], data[1], data[2], data[3], data[4].chomp)
        arrays.push(reader)
      when 'orders'
        book = @library.arr_books.select { |v| v.name_book == data[0] }.first
        reader = @library.arr_readers.select { |v| v.name_reader == data[1] }.first
        order = Order.new(book, reader, data[2].chomp)
        arrays.push(order)
      end
    end
    arrays
  end
end
