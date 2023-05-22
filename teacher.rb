require './require'

class Teacher
  def initialize(age, specialization, name = 'unknow', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
