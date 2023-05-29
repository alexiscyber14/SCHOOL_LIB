module CreateRental
  def create_rental
    puts 'Select a book from the following list by number:'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title.capitalize}\", Author: #{book.author.capitalize}"
    end
    book_choice = gets.chomp.to_i
    puts "\n"
    if book_choice < 0 || book_choice > @books.length
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

    if person_choice < 0 || person_choice > @people.length
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
end
