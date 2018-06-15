require_relative 'model/library'
require_relative 'utils/data_processing'
require_relative 'utils/test_data'

@library = Library.new
@library = DataProcessing.file_exists? ? DataProcessing.reads_library_file : TestData.loading_data
puts '1. Loading the library successfully!'

puts "\n2. Often takes the book:"
readers = @library.often_takes_the_book_by_reader
readers.each { |reader, count| puts "\tTaken books: #{count}; Name reader: #{reader}\n" }

puts "\n3. Most popular book:"
books = @library.most_popular_book
books.each do |book, count|
  puts "\tBook: #{book}; Number of requests: #{count}\n"
end

count = @library.how_many_order_popular_books
puts "\n4. The count of readers who ordered the three most popular books: #{count}"

DataProcessing.writes_library_file(@library)
puts "\n5. All library data is saved to a file!"
