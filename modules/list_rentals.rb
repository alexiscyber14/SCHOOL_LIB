module ListRentals
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
