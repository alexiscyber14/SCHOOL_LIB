require_relative '../person'
require_relative '../book'
require_relative '../rental'
require_relative '../students'
require_relative '../teacher'
require_relative '../modules/list_books'
require_relative '../modules/list_people'
require_relative '../modules/create_persons'
require_relative '../modules/list_rentals'
require_relative '../modules/create_rental'
require_relative '../modules/create_book'
require_relative '../modules/check_files_existence'
require_relative '../app'

RSpec.describe App do
  let(:app) { described_class.new }

  describe '#initialize' do
    it 'initializes the attributes' do
      expect(app.people).to be_empty
      expect(app.books).to be_empty
      expect(app.rentals).to be_empty
    end
  end

  describe 'included modules' do
    it 'includes the ListBooks module' do
      expect(app).to be_a(ListBooks)
    end

    it 'includes the ListPeople module' do
      expect(app).to be_a(ListPeople)
    end

    it 'includes the CreatePerson module' do
      expect(app).to be_a(CreatePerson)
    end

    it 'includes the CreateBook module' do
      expect(app).to be_a(CreateBook)
    end

    it 'includes the CreateRental module' do
      expect(app).to be_a(CreateRental)
    end

    it 'includes the ListRentals module' do
      expect(app).to be_a(ListRentals)
    end

    it 'includes the Files module' do
      expect(app).to be_a(Files)
    end
  end
end
