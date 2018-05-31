class Library
  attr_accessor :arr_books, :arr_authors, :arr_readers, :arr_orders

  def initialize
    @arr_books = []
    @arr_authors = []
    @arr_readers = []
    @arr_orders = []
  end

  def often_takes_the_book_by_reader
    h_readers = {}
    arr_readers.each do |reader|
      h_readers[reader.name_reader] = arr_orders.select { |order| order.reader == reader }.size
    end
    readers = h_readers.select { |_k, v| v == h_readers.values.max }
    readers.each { |name_reader, count| puts "\tTaken books: #{count}; Name reader: #{name_reader}\n" }
  end

  def most_popular_book
    hash_books = all_books
    books = hash_books.select { |_k, v| v == hash_books.values.max }
    books.each do |book, count|
      puts "\tBook: #{book.name_book}; Author: #{book.author.name_author}; Number of requests: #{count}\n"
    end
  end

  def one_of_the_three_most_popular_books
    books = all_books.sort_by { |_name, count| count }.reverse
    print_books(books)
  end

  def all_books
    hash_books = {}
    arr_books.each do |book|
      hash_books[book] = arr_orders.select { |order| order.book == book }.size
    end
    hash_books
  end

  def print_books(books)
    puts "\tTotal there are #{books.size} books in the library"
    puts "\t Of which the three most popular books are: "
    books[0..2].each do |book, count|
      puts "\t   Book: '#{book.name_book}'; Number of people who ordered this book: '#{count}'"
    end
    puts "\t Other books: "
    books[3...books.size].each do |book, count|
      puts "\t   Book: '#{book.name_book}'; Number of people who ordered this book: '#{count}'"
    end
  end
end
