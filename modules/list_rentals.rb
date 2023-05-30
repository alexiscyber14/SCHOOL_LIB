require 'json'

module ListRentals
  def list_rentals_for_person
    print 'ID of person: '
    person_id = gets.chomp.to_i

    people_data = JSON.parse(File.read('./data/people.json'))
    person = people_data.find { |p| p['id'] == person_id }
    if person.nil?
      puts "Person with ID #{person_id} not found."
      puts "\n"
      return
    end

    rentals_data = JSON.parse(File.read('./data/rentals.json'))
    rentals_for_person = rentals_data.select { |rental| rental['person_id'] == person_id }

    if rentals_for_person.empty?
      puts "No rentals found for person with ID #{person_id}."
    else
      puts 'Rentals:'
      rentals_for_person.each do |rental|
        puts "Date: #{rental['rental_date']}, Book \"#{rental['title']}\" by #{rental['author']}, Person ID: #{rental['person_id']}"
      end
    end

    puts "\n"
  end
end
