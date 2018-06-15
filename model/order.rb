class Order
  attr_reader :book, :reader, :date

  def initialize(order_data)
    @book = order_data[:book]
    @reader = order_data[:reader]
    @date = order_data[:date]
  end
end
