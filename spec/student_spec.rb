require 'rspec'
require_relative '../students'
require_relative '../classroom'

describe Student do
  classroom = Classroom.new('Class A')
  student = Student.new('Bon Sage', 16, classroom, true)

  describe '#initialize' do
    it 'sets the age, name, classroom, parent_permission' do
      expect(student.age).to eq(16)
      expect(student.name).to eq('Bon Sage')
      expect(student.classroom).to eq(classroom)
    end
  end

  describe '#classroom=' do
    it 'assigns the classroom and adds the student to the classroom' do
      new_classroom = Classroom.new('Class B')
      student.classroom = new_classroom
      expect(student.classroom).to eq(new_classroom)
      expect(new_classroom.students).to include(student)
    end
  end

  describe '#play_hooky' do
    it 'returns a string indicating playing hooky' do
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
