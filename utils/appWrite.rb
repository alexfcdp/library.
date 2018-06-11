require_relative '../model/book'
require_relative '../model/author'
require_relative '../model/reader'
require_relative '../model/order'
require_relative '../model/library'

class AppWrite
  def initialize(library)
    @library = library
    write_all_files
  end

  private

  def write_all_files
    AppReader::FILES.each do |key, path|
      File.open(path, 'w') do |data_set|
        write_data_by_key(key, data_set)
      end
    end
  end

  def write_data_by_key(key, data_set)
    case key
    when :authors then write_authors(data_set)
    when :books then write_books(data_set)
    when :readers then write_readers(data_set)
    when :orders then write_orders(data_set)
    end
  end

  def write_authors(data_set)
    @library.authors.each do |author|
      data_set.write("#{author.name_author};#{author.biography}\n")
    end
  end

  def write_books(data_set)
    @library.books.each do |book|
      data_set.write("#{book.name_book};#{book.author.name_author}\n")
    end
  end

  def write_readers(data_set)
    @library.readers.each do |reader|
      data_set.write("#{reader.name_reader};#{reader.email};#{reader.city};#{reader.street};#{reader.house}\n")
    end
  end

  def write_orders(data_set)
    @library.orders.each do |order|
      data_set.write("#{order.book.name_book};#{order.reader.name_reader};#{order.date}\n")
    end
  end
end
