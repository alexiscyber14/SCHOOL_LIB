module CreatePerson
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
    student = Student.new(name, age, parent_permission: parent_permission)
    @people << student
    puts 'Student created successfully'
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
end
