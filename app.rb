require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'students'
require_relative 'teacher'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @people = []
    @books = []
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
      puts "Nmae: #{person.name} Age : #{person.age} ID: #{person.id}"
    end
  end

  def create_person
    print 'Do you want to create a student '
    puts '(1) Student, or a teacher (2)?  [input the number]:'

    person_input = gets.chomp.to_i

    case person_input
    when 1 then create_student
    when 2 then create_teacher
    else
      raise 'Please choose a valid option, number 1 or 2'
    end
  end

  def create_student
    puts 'Name:'
    name = gets.chomp
    puts 'Age:'
    age = gets.chomp
    puts 'Has parent permision? [Y/N]'
    parent_permission_input = gets.chomp
    parent_permission = parent_permission_input.upcase == 'Y'
    if parent_permission
      student = Student.new(name, age, parent_permission: parent_permission)
      @people << student
      puts 'Student created successfully'
    else
      puts 'Sorry, you need a parent permission to create a student.'
    end
  end

  def create_teacher
    puts 'Name:'
    name = gets.chomp
    puts 'Age:'
    age = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    teacher = Teacher.new(name, age, specialization)
    @people << teacher
    puts 'Person created successfuly'
  end

  def create_book
    puts 'Create Book:'
    puts 'Enter title:'
    title = gets.chomp
    puts 'Enter author:'
    author = gets.chomp

    book = Book.new(title, author)
    books << book
    puts "Book #{book.title} by #{book.author} created."
  end

  def create_rental
    puts 'Create Rental:'
    puts 'Select a book by number:'

    @books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.title} by #{book.author}"
    end

    book_choice = gets.chomp.to_i

    if book_choice < 1 || book_choice > @books.length
      puts 'Invalid book selection.'
      return
    end

    selected_book = @books[book_choice - 1]

    puts 'Select a person by number:'

    @people.each_with_index do |person, index|
      puts "#{index + 1}. #{person.name}"
    end

    person_choice = gets.chomp.to_i

    if person_choice < 1 || person_choice > @people.length
      puts 'Invalid person selection.'
      return
    end

    selected_person = @people[person_choice - 1]

    puts 'Enter rental date (YYYY-MM-DD):'
    rental_date = gets.chomp

    rental = Rental.new(rental_date, selected_person, selected_book)
    @rentals << rental

    puts 'Rental created successfully!'
  end

  def list_rentals_for_person
    puts 'Enter person ID:'
    person_id = gets.chomp.to_i

    person = people.find { |p| p.id == person_id }

    if person.nil?
      puts "Person with ID #{person_id} not found."
      return
    end

    puts "Rentals for #{person.name}:"
    rentals_for_person = rentals.select { |rental| rental.person == person }
    rentals_for_person.each do |rental|
      puts "#{rental.book.title} by #{rental.book.author} (Rented on #{rental.date})"
    end
  end
end
