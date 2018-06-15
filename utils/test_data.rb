require_relative '../model/book'
require_relative '../model/author'
require_relative '../model/reader'
require_relative '../model/order'

class TestData
  AUTHORS = [
    { name: 'Gregory Brown', biography: 'Has run the independently published Practicing Ruby' },
    { name: 'David Chelimsky', biography: 'Developer and lead cavaquinista at @cognitect' },
    { name: 'Paolo Perrotta', biography: 'Has more than ten years of experience as a developer' },
    { name: 'Peter J. Jones', biography: 'Peter J.Jones has been working professionally with Ruby' },
    { name: 'Leonard Richardson', biography: 'Author of robotfindskitten,Beautiful Soup' },
    { name: 'Jay McGavren', biography: 'Jay is a development teacher at Treehouse' },
    { name: 'Dawn Griffiths', biography: 'Popular Series By Dawn Griffiths' }
  ].freeze
  BOOKS = [
    { name_book: 'Ruby Best Practices', author: AUTHORS[0][:name] },
    { name_book: 'The RSpec Book', author: AUTHORS[1][:name] },
    { name_book: 'Metaprogramming Ruby 2', author: AUTHORS[2][:name] },
    { name_book: 'Effective Ruby: 48', author: AUTHORS[3][:name] },
    { name_book: 'Ruby Cookbook', author: AUTHORS[4][:name] },
    { name_book: 'RESTful Web APIs', author: AUTHORS[4][:name] },
    { name_book: 'RESTful Web Services', author: AUTHORS[4][:name] },
    { name_book: 'Head First Ruby', author: AUTHORS[5][:name] },
    { name_book: 'Use a Cabeca!: Ruby', author: AUTHORS[5][:name] },
    { name_book: 'Use a Cabeca!: Rails', author: AUTHORS[6][:name] },
    { name_book: 'Head First C', author: AUTHORS[6][:name] }
  ].freeze

  READERS = [
    { name: 'Aleksey Zentcev', email: 'aleksey@gmail.com', city: 'Dnipro', street: 'st. Kim', house: '1' },
    { name: 'Alexander Sushko', email: 'alexander@i.ua', city: 'Dnipro', street: 'st. Baha', house: '12' },
    { name: 'Alisa Tilik', email: 'ali@gmail.com', city: 'Dnipro', street: 'st. Vakhrusheva', house: '3' },
    { name: 'Andrey Taran', email: 'andrey@gmail.com', city: 'Dnipro', street: 'st. Artema', house: '46' },
    { name: 'Anton Voronin', email: 'antonV@gmail.com', city: 'Dnipro', street: 'st. Mira', house: '152' },
    { name: 'Artem Ribka', email: 'artem@gmail.com', city: 'Dnipro', street: 'st. Zernovaya', house: '6' },
    { name: 'Danil Migrin', email: 'danil@gmail.com', city: 'Dnipro', street: 'st. 1 Maya', house: '127' },
    { name: 'Dmitryi Vagan', email: 'dim@i.ua', city: 'Dnipro', street: 'st. Baydakovskaya', house: '38' },
    { name: 'Elina Bets', email: 'elina@gmail.com', city: 'Dnipro', street: 'st. Kviringa', house: '291' },
    { name: 'Aleks Semeoshin', email: 'aleks_sem@i.ua', city: 'Dnipro', street: 'st. Abay', house: '101' }
  ].freeze

  ORDERS = [
    { book: BOOKS[0][:name_book], reader: READERS[0][:name], date: '09.04.2018' },
    { book: BOOKS[1][:name_book], reader: READERS[1][:name], date: '10.04.2018' },
    { book: BOOKS[2][:name_book], reader: READERS[2][:name], date: '10.04.2018' },
    { book: BOOKS[3][:name_book], reader: READERS[3][:name], date: '10.04.2018' },
    { book: BOOKS[4][:name_book], reader: READERS[4][:name], date: '15.04.2018' },
    { book: BOOKS[5][:name_book], reader: READERS[5][:name], date: '16.04.2018' },
    { book: BOOKS[6][:name_book], reader: READERS[6][:name], date: '16.04.2018' },
    { book: BOOKS[7][:name_book], reader: READERS[7][:name], date: '25.04.2018' },
    { book: BOOKS[8][:name_book], reader: READERS[8][:name], date: '26.04.2018' },
    { book: BOOKS[9][:name_book], reader: READERS[9][:name], date: '28.04.2018' },
    { book: BOOKS[4][:name_book], reader: READERS[4][:name], date: '28.04.2018' },
    { book: BOOKS[2][:name_book], reader: READERS[5][:name], date: '29.04.2018' },
    { book: BOOKS[0][:name_book], reader: READERS[2][:name], date: '01.05.2018' },
    { book: BOOKS[4][:name_book], reader: READERS[9][:name], date: '03.05.2018' },
    { book: BOOKS[2][:name_book], reader: READERS[9][:name], date: '04.05.2018' },
    { book: BOOKS[4][:name_book], reader: READERS[9][:name], date: '04.05.2018' },
    { book: BOOKS[2][:name_book], reader: READERS[2][:name], date: '04.05.2018' },
    { book: BOOKS[2][:name_book], reader: READERS[2][:name], date: '04.05.2018' },
    { book: BOOKS[2][:name_book], reader: READERS[0][:name], date: '04.05.2018' },
    { book: BOOKS[2][:name_book], reader: READERS[9][:name], date: '05.05.2018' },
    { book: BOOKS[2][:name_book], reader: READERS[2][:name], date: '06.05.2018' }
  ].freeze

  def self.loading_data
    library = Library.new
    library.authors = AUTHORS.map { |author_data| Author.new(author_data) }
    library.books = BOOKS.map { |book_data| Book.new(book_data) }
    library.readers = READERS.map { |reader_data| Reader.new(reader_data) }
    library.orders = ORDERS.map { |order_data| Order.new(order_data) }
    library
  end
end
