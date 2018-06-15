class Book
  attr_reader :name_book, :author

  def initialize(book_data)
    @name_book = book_data[:name_book]
    @author = book_data[:author]
  end
end
