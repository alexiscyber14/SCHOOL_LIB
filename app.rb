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
      puts "Title: #{book.title.capitalize}, Author: #{book.author.capitalize}"
    end
    puts "\n"
  end

  def list_people
    puts 'List of People:'
    @people.each do |person|
      status = if person.is_a?(Student)
                 'Student'
               elsif person.is_a?(Teacher)
                 'Teacher'
               else
                 'Unknown'
               end
      puts "[#{status}] Name: #{person.name.capitalize}, ID: #{person.id}, Age: #{person.age}"
    end
    puts "\n"
  end

  def create_person
    print 'Do you want to create a student (1) Student, or a teacher (2)?  [input the number]: '
    person_input = gets.chomp.to_i
    case person_input
    when 1 then create_student
    when 2 then create_teacher
    else
      raise 'Please choose a valid option, number 1 or 2'
    end
  end

  def create_student
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission_input = gets.chomp
    parent_permission = parent_permission_input.upcase == 'Y'
    if parent_permission
      student = Student.new(name, age, parent_permission: parent_permission)
      @people << student
      puts 'Student created successfully'
    else
      puts 'Sorry, you need parent permission to create a student.'
    end
    puts "\n"
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(name, age, specialization)
    @people << teacher
    puts 'Person created successfully'
    puts "\n"
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    books << book
    puts 'Book created succesfully.'
    puts "\n"
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title.capitalize}\", Author: #{book.author.capitalize}"
    end
    book_choice = gets.chomp.to_i
    puts "\n"
    if book_choice? || book_choice > @books.length
      puts 'Invalid book selection.'
      return
    end

    selected_book = @books[book_choice - 1]
    puts "\n"
    puts 'Select a person from the following list by number (not id):'

    @people.each_with_index do |person, index|
      status = if person.is_a?(Student)
                 'Student'
               elsif person.is_a?(Teacher)
                 'Teacher'
               else
                 'Unknown'
               end
      puts "#{index}) [#{status}] Name: #{person.name.capitalize}, ID: #{person.id}, Age: #{person.age}"
    end

    person_choice = gets.chomp.to_i

    if person_choice? || person_choice > @people.length
      puts 'Invalid person selection.'
      puts "\n"
      return
    end

    selected_person = @people[person_choice - 1]

    print 'Date: '
    rental_date = gets.chomp
    rental = Rental.new(rental_date, selected_person, selected_book)
    @rentals << rental

    puts 'Rental created successfully!'
    puts "\n"
  end

  def list_rentals_for_person
    print 'ID of person: '
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts "Person with ID #{person_id} not found."
      puts "\n"
      return
    end

    puts 'Rentals:'
    rentals_for_person = @rentals.select { |rental| rental.person == person }
    rentals_for_person.each do |rental|
      puts "Date: #{rental.date},  Book \"#{rental.title}\"  by #{rental.author}"
    end
    puts "\n"
  end
end
