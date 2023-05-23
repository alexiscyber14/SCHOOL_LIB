require_relative 'book'
require_relative 'person'
require_relative 'rental'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    puts 'List of Books:'
    @books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end

  def list_people
    puts 'List of People:'
    @people.each do |person|
      puts "#{person.name} (ID: #{person.id})"
    end
  end

  def create_person
    puts 'Enter person details:'
    puts 'Name:'
    name = gets.chomp
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Person Type (teacher/student):'
    person_type = gets.chomp.downcase

    if person_type == 'teacher'
      puts 'Specialization:'
      specialization = gets.chomp
      person = Teacher.new(age, name, specialization: specialization)
    elsif person_type == 'student'
      puts 'Classroom:'
      classroom = gets.chomp
      person = Student.new(age, name, classroom: classroom)
    else
      puts 'Invalid person type.'
      return
    end

    @people << person
    puts 'Person created successfully!'
  end

  def create_book
    puts 'Enter book details:'
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp

    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully!'
  end

  def create_rental
    puts 'Enter rental details:'
    puts 'Person ID:'
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }

    if person.nil?
      puts 'Person not found.'
      return
    end

    puts 'Book ID:'
    book_id = gets.chomp.to_i
    book = @books.find { |b| b.id == book_id }

    if book.nil?
      puts 'Book not found.'
      return
    end

    rental = Rental.new(person, book)
    @rentals << rental
    puts 'Rental created successfully!'
  end

  def list_rentals_by_person_id
    puts 'Enter person ID:'
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }

    if person.nil?
      puts 'Person not found.'
      return
    end

    rentals = @rentals.select { |r| r.person == person }
    puts "Rentals for #{person.name} (ID: #{person.id}):"
    rentals.each do |rental|
      puts "#{rental.book.title} by #{rental.book.author}"
    end
  end
end
