require 'rspec'
require_relative '../rental'
require_relative '../person'
require_relative '../book'

RSpec.describe Rental do
  let(:book) { Book.new('Ballet Shoes', 'Noel Streatfield') }
  let(:person) { Person.new('John Doe', 20) }
  let(:rental_date) { '5/30/2023' }
  let(:rental) { described_class.new(rental_date, person, book) }

  describe '#initialize' do
    it 'sets the date, person, and book correctly' do
      expect(rental.date).to eq(rental_date)
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
    end

    it 'adds the rental to the book and person' do
      expect(book.rentals).to include(rental)
      expect(person.rentals).to include(rental)
    end
  end

  describe '#title' do
    it 'returns the title of the book' do
      expect(rental.title).to eq('Ballet Shoes')
    end
  end

  describe '#author' do
    it 'returns the author of the book' do
      expect(rental.author).to eq('Noel Streatfield')
    end
  end
end
