require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name: 'Unknown')
    super(age, parent_permission: true, name: name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
