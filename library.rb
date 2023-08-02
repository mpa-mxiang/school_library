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
    @id = []
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

  def find_person_by_id(id)
    @people.find { |person| person.id == id }
  end

  def available_books
    @books.select { |book| book.rentals.empty? }
  end

  def rentals_by_person_id(person_id)
    person = @people.find { |person| person.id == person_id }
    if person.nil?
      puts "Person with ID #{person} not found."
      return []
    end

    @rentals.select { |rental| rental.person_id == person_id }
  end

end
