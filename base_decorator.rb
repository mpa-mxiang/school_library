require_relative 'nameable'

class BaseDecorator < Nameable
  def initialize(component)
    super()
    @component = component
  end

  def correct_name
    @component.correct_name
  end
end
