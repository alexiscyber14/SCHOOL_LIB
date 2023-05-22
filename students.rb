require './person'
require './classroom.rn'

class Student < Person
  def initialize(age, classroom, name = 'unknow', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def plays_hhoky
    '¯\\(ツ)/¯'
  end
end
