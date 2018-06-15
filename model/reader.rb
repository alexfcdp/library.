class Reader
  attr_reader :name_reader, :email, :city, :street, :house

  def initialize(reader_data)
    @name_reader = reader_data[:name_reader]
    @email = reader_data[:email]
    @city = reader_data[:city]
    @street = reader_data[:street]
    @house = reader_data[:house]
  end
end
