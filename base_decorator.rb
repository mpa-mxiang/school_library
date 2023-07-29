require_relative 'nameable'

class BaseDecorator < Nameable
  def initialize(component)
    @component = component
  end

  def correct_name
    @component.correct_name
  end
end
