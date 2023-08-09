require_relative 'base_decorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

test = BaseDecorator.new('benja')
CapitalizeDecorator.new(test)
p test.correct_name
