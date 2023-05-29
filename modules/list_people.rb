module ListPeople
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
end
