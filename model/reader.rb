class Reader
  attr_reader :name_reader, :email, :city, :street, :house

  def initialize(name_reader, email, city, street, house)
    @name_reader = name_reader
    @email = email
    @city = city
    @street = street
    @house = house
  end
end
