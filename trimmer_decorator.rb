require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    @component.correct_name.strip
  end
end
