class Rental
  attr_reader :date, :student, :book

  def initialize(date, student, book)
    @date = date
    @student = student
    @book = book
  end
end