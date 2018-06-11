require_relative 'model/library'
require_relative 'utils/appReader'
require_relative 'utils/appWrite'
require_relative 'utils/testData'

@library = Library.new

AppReader.exist_files? ? AppReader.new(@library) : TestData.new(@library)
puts '1. Loading the library successfully!'

puts "\n2. Often takes the book:"
readers = @library.often_takes_the_book_by_reader
readers.each { |reader, count| puts "\tTaken books: #{count}; Name reader: #{reader.name_reader}\n" }

puts "\n3. Most popular book:"
books = @library.most_popular_book
books.each do |book, count|
  puts "\tBook: #{book.name_book}; Author: #{book.author.name_author}; Number of requests: #{count}\n"
end

puts "\n4. The three most popular books ordered by readers: "
books = @library.how_many_order_popular_books
books.each do |book, count|
  puts "\tThe count of people: #{count}; Book: #{book.name_book}"
end

AppWrite.new(@library)
puts "\n5. All library data is saved to a file!"
