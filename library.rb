# library.rb
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'classroom'

class Library
  attr_reader :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
    @classrooms = []
  end

  # Add a person to the list of people in the library
  def add_person(person)
    @people << person
  end

  # Add a book to the list of books in the library
  def add_book(book)
    @books << book
  end

  # Add a rental to the list of rentals in the library
  def add_rental(rental)
    @rentals << rental
  end

  def find_or_create_classroom(label)
    classroom = @classrooms.find { |c| c.label == label }
    return classroom if classroom

    classroom = Classroom.new(label)
    @classrooms << classroom
    classroom
  end
end
