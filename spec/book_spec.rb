require 'rspec'
require_relative '../book'
require_relative '../person'
require_relative '../rental'

describe Book do
  let(:book) { Book.new('Ballet Shoes', 'Noel Streatfield') }
  let(:person) { Person.new(19, 'David') }
  let(:date) { '4/13/2022' }

  describe '#initialize' do
    it 'sets the title and author' do
      expect(book.title).to eq('Ballet Shoes')
      expect(book.author).to eq('Noel Streatfield')
    end

    it 'initializes rentals as an empty array' do
      expect(book.rentals).to be_an(Array)
      expect(book.rentals).to be_empty
    end

    it 'generates a random id between 1 and 1000' do
      expect(book.id).to be_between(1, 1000)
    end
  end

  describe '#add_rental' do
    it 'creates a new rental with the provided date and person' do
      rental = book.add_rental(date, person)
      expect(rental).to be_an_instance_of(Rental)
      expect(rental.date).to eq(date)
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
    end

    it 'adds the rental to the rentals array' do
      book.add_rental(date, person)
      expect(book.rentals.length).to eq(1)
      expect(book.rentals.first.date).to eq(date)
      expect(book.rentals.first.person).to eq(person)
    end
  end
end
