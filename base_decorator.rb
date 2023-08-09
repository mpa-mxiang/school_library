require './nameable'

class BaseDecorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    # self.nameable = nameable
    @nameable = nameable
    super()
  end

  def correct_name
    @nameable
  end
end
