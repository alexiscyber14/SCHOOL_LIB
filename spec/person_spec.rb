require 'rspec'
require_relative '../person'

RSpec.describe Person do
  let(:person) { Person.new('John', 25) }

  describe '#can_use_services?' do
    context 'when the person is of age' do
      it 'returns true' do
        expect(person.can_use_services?).to be true
      end
    end

    context 'when the person is under age and has parent permission' do
      let(:person) { Person.new('Jane', 16, parent_permission: true) }

      it 'returns true' do
        expect(person.can_use_services?).to be true
      end
    end

    context 'when the person is under age and has no parent permission' do
      let(:person) { Person.new('Jack', 17, parent_permission: false) }

      it 'returns false' do
        expect(person.can_use_services?).to be false
      end
    end
  end

  describe '#add_rental' do
    let(:book) { instance_double('Book') }
    let(:date) { '2023-05-30' }
    let(:rental) { instance_double('Rental') }

    before do
      allow(Rental).to receive(:new).with(date, person, book).and_return(rental)
    end

    it 'creates a new rental with the person and book' do
      expect(Rental).to receive(:new).with(date, person, book)
      person.add_rental(book, date)
    end

    it 'returns the created rental' do
      expect(person.add_rental(book, date)).to eq(rental)
    end
  end
end
