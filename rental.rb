require_relative 'person'
require_relative 'book'

class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @book = book
    @person = person
    @book.rentals << self
    @person.rentals << self
  end

  def title
    @book.title
  end

  def author
    @book.author
  end
end
