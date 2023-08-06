# library.rb
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'classroom'

class Library
  attr_reader :people, :books, :rentals, :classrooms

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

  def find_person_by_id(id)
    @people.find { |person| person.id == id }
  end

  def available_books
    @books.select { |book| book.rentals.empty? }
  end

  def rentals_by_person_id(id)
    person = find_person_by_id(id)
    return [] if person.nil?

    @rentals.select { |rental| rental.person == person }
  end

  def save_data_to_files
    save_to_file('books.json', @books)
    save_to_file('people.json', @people)
    save_to_file('rentals.json', @rentals)
    save_to_file('classrooms.json', @classrooms)
  end

  def load_data_from_files
    @books = load_from_file('books.json') || []
    @people = load_from_file('people.json') || []
    @rentals = load_from_file('rentals.json') || []
    @classrooms = load_from_file('classrooms.json') || []
  end

  private

  def save_to_file(file_path, data)
    File.write(file_path, JSON.generate(data))
  end

  def load_from_file(file_path)
    JSON.parse(File.read(file_path)) if File.exist?(file_path)
  end
end
