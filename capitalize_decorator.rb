require_relative 'base_decorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @component.correct_name.capitalize
  end
end
