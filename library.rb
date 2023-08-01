# library.rb
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class Library
  attr_reader :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  # Implement the methods to interact with the library data.
  # For example: add_person, add_book, add_rental, find_person_by_id, etc.
end
