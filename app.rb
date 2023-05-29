require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'students'
require_relative 'teacher'
require_relative './modules/list_books'
require_relative './modules/list_people'
require_relative './modules/create_persons'
require_relative './modules/list_rentals'
require_relative './modules/create_rental'
require_relative './modules/create_book'

class App
  include ListBooks
  include ListPeople
  include CreatePerson
  include CreateBook
  include CreateRental
  include ListRentals
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end
end
