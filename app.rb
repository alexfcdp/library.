require_relative 'model/library'
require_relative 'utils/appReader'
require_relative 'utils/appWrite'
require_relative 'utils/testData'

library = Library.new

AppReader.exist_files? ? AppReader.new(library) : TestData.new(library)

puts '1. Loading the library successfully!'

puts "\n2. Often takes the book:"
library.often_takes_the_book_by_reader

puts "\n3. Most popular book:"
library.most_popular_book

puts "\n4. How many people ordered one of the three most popular books?"
library.one_of_the_three_most_popular_books

AppWrite.new(library)
puts "\n5. All library data is saved to a file!"
