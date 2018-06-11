class Library
  attr_accessor :books, :authors, :readers, :orders

  def initialize
    @books = []
    @authors = []
    @readers = []
    @orders = []
  end

  def often_takes_the_book_by_reader
    regular_readers = get_all_object(:reader)
    regular_readers.select { |_, value| value == regular_readers.values.max }
  end

  def most_popular_book
    regular_readers = get_all_object(:book)
    regular_readers.select { |_, value| value == regular_readers.values.max }
  end

  def how_many_order_popular_books
    get_all_object(:book).sort_by { |_, count| count }.reverse.first(3)
  end

  def get_all_object(obj)
    orders.group_by(&obj).transform_values(&:count)
  end
end
