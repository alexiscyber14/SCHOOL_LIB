require_relative 'person'

class Student < Person
  def initialize(name, age, classroom = nil, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end
end
