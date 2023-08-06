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
  end

  def load_books_from_file
    @books = JSON.parse(File.read('books.json')) if File.exist?('books.json')
  end

  def load_people_from_file
    @people = JSON.parse(File.read('people.json')) if File.exist?('people.json')
  end

  def load_rentals_from_file
    @rentals = JSON.parse(File.read('rentals.json')) if File.exist?('rentals.json')
  end
  private

  def save_to_file(file_path, data)
    File.write(file_path, JSON.generate(data), mode='a+')
  end
end
