require './app'
require_relative './ui_methods'

def main
  puts 'Welcome To School Library App!'
  puts "\n"
  app = App.new
  choices = {
    1 => :list_books,
    2 => :list_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals_for_person,
    7 => :quit
  }

  loop do
    display_menu
    choice = gets.chomp.to_i
    handle_choice(choice, app, choices)
    break if choice == 7
  end
end

def display_menu
  puts 'Please choose an option by entering a number:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a person'
  puts '7. Exit'
end

main
