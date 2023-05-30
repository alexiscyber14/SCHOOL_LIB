require 'json'
module CreatePerson
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '
    person_input = gets.chomp.to_i
    case person_input
    when 1
      create_student
    when 2
      create_teacher
    else
      raise 'Please choose a valid option, number 1 or 2'
    end
  end

  def create_student
    create_person_common('student')
  end

  def create_teacher
    create_person_common('teacher')
  end

  def create_person_common(role)
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    if role == 'student'
      print 'Has parent permission? [Y/N]: '
      parent_permission_input = gets.chomp
      parent_permission = parent_permission_input.upcase == 'Y'
      person = Student.new(name, age, parent_permission: parent_permission)
    elsif role == 'teacher'
      print 'Specialization: '
      specialization = gets.chomp
      person = Teacher.new(name, age, specialization)
    end
    @people << person
    save_people_to_json

    puts "#{role.capitalize} created successfully"
    puts "\n"
  end

  def save_people_to_json
    data = @people.map do |p|
      if p.is_a?(Student)
        {
          role: 'student',
          name: p.name,
          age: p.age,
          parent_permission: p.instance_variable_get(:@parent_permission),
          id: p.id
        }
      elsif p.is_a?(Teacher)
        {
          role: 'teacher',
          name: p.name,
          age: p.age,
          specialization: p.specialization,
          id: p.id
        }
      end
    end

    begin
      existing_people = JSON.parse(File.read('./data/people.json'))
    rescue JSON::ParserError, EOFError
      existing_people = []
    end

    data += existing_people if existing_people.is_a?(Array)
    File.write('./data/people.json', JSON.generate(data))
  end
end
