require 'json'
require_relative '../person'
require_relative '../book'
require_relative '../rental'
require_relative '../students'
require_relative '../teacher'

module CreateRental
  SelectedData = Struct.new(:rental_date, :title, :author, :person_id)
  def create_rental
    puts 'Select a book from the following list by number:'
    books_data = JSON.parse(File.read('./data/books.json'))
    @books = books_data
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book['title']}\", Author: #{book['author']}"
    end
    book_choice = gets.chomp.to_i
    puts "\n"
    if book_choice < 0 || book_choice.to_i >= @books.length
      puts 'Invalid book selection.'
      return
    end
    book = @books[book_choice]
    puts 'Select a person from the following list by number (not id):'
    people_data = JSON.parse(File.read('./data/people.json'))
    @people = people_data
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person['role'].capitalize}] Name: #{person['name'].capitalize}, ID: #{person['id']}, Age: #{person['age']}"
    end
    person_choice = gets.chomp.to_i
    if person_choice < 0 || person_choice >= @people.length
      puts 'Invalid person selection.'
      puts "\n"
      return
    end
    person_id = @people[person_choice]['id']
    print 'Date: '
    rental_date = gets.chomp
    selected_data = SelectedData.new(rental_date, book['title'], book['author'], person_id)
    if File.exist?('./data/rentals.json')
      json_data = File.read('./data/rentals.json')
      existing_rentals = JSON.parse(json_data) unless json_data.empty?
    else
      existing_rentals = []
    end
    existing_rentals ||= []
    existing_rentals << {
      'rental_date' => selected_data.rental_date,
      'title' => selected_data.title,
      'author' => selected_data.author,
      'person_id' => selected_data.person_id
    }
    File.write('./data/rentals.json', JSON.generate(existing_rentals))
    puts 'Rental created successfully!'
    puts "\n"
  end
end
