module ListPeople
  def list_people
    puts 'List of People:'
    if File.exist?('./data/people.json')
      file = File.read('./data/people.json')
      people = JSON.parse(file)
      people.each do |people_data|
        role = people_data['role']
        name = people_data['name']
        age = people_data['age']
        id = people_data['id']
        puts "[#{role}] Name: #{name}, ID: #{id}, Age: #{age}"
      end
    else
      puts 'Error: File does not exist.'
      print 'Enter "1" to exit the program: '
      input = gets.chomp
      exit if input == '1'
    end
    puts "\n"
  end
end
