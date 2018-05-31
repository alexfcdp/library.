require_relative '../model/book'
require_relative '../model/author'
require_relative '../model/reader'
require_relative '../model/order'
require_relative '../model/library'

class AppWrite
  def initialize(library)
    @library = library
    file_writes(AppReader::FILE_AUTHORS, 'authors')
    file_writes(AppReader::FILE_BOOKS, 'books')
    file_writes(AppReader::FILE_READERS, 'readers')
    file_writes(AppReader::FILE_ORDERS, 'orders')
  end

  private

  def file_writes(file, name)
    data_set = File.open(file, 'w')
    case name
    when 'authors'
      @library.arr_authors.each do |author|
        data_set.write("#{author.name_author};#{author.biography}\n")
      end
    when 'books'
      @library.arr_books.each do |book|
        data_set.write("#{book.name_book};#{book.author.name_author}\n")
      end
    when 'readers'
      @library.arr_readers.each do |reader|
        data_set.write("#{reader.name_reader};#{reader.email};#{reader.city};#{reader.street};#{reader.house}\n")
      end
    when 'orders'
      @library.arr_orders.each do |order|
        data_set.write("#{order.book.name_book};#{order.reader.name_reader};#{order.date}\n")
      end
    end
  end
end
