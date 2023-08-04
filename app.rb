# app.rb
require_relative 'library'

class App
  def initialize
    @library = Library.new
  end

  def main
    puts 'Welcome to the Library Management System!'
    loop do
      print_options
      option = gets.chomp.to_i
      break if option == 7

      execute_option(option)
    end
    puts 'Thank you for using the Library Management System. Goodbye!'
  end

  private

  def print_options
    puts "\nSelect an option:"
    puts '1. List all books.'
    puts '2. List all people.'
    puts '3. Create a person.'
    puts '4. Create a book.'
    puts '5. Create a rental.'
    puts '6. List all rentals for a given id.'
    puts '7. Exit.'
  end

  def execute_option(option)
    case option
    when 1
      list_books
    when 2
      list_people
    when 3
      print_create_person_options
      person_option = gets.chomp.to_i
      create_person(person_option)
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rental
    else
      puts 'Invalid option. Please try again.'
    end
  end

  def list_books
    @library.books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end

  def list_people
    @library.people.each do |person|
      puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age} [#{person.class}]"
    end
  end

  def print_create_person_options
    puts "\nSelect a person type to create:"
    puts '1. Create a teacher.'
    puts '2. Create a student.'
  end

  def create_person(option)
    case option
    when 1
      create_teacher
    when 2
      create_student
    else
      puts 'Invalid option. Please try again.'
    end
  end

  def create_teacher
    print "Enter teacher's name: "
    name = gets.chomp

    print "Enter teacher's age: "
    age = gets.chomp.to_i

    print "Enter teacher's specialization: "
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name: name)
    @library.add_person(teacher)
    puts "Teacher #{name} created successfully."
  end

  def create_student
    print "Enter student's name: "
    name = gets.chomp

    print "Enter student's age: "
    age = gets.chomp.to_i

    print "Enter student's classroom: "
    classroom_name = gets.chomp

    classroom = @library.find_or_create_classroom(classroom_name)

    student = Student.new(age, classroom, name: name)
    @library.add_person(student)
    puts "Student #{name} created successfully."
  end

  def create_book
    print 'Enter book title: '
    title = gets.chomp
    print 'Enter author name: '
    author = gets.chomp
    book = Book.new(title, author)
    @library.add_book(book)
    puts "Book '#{title}' by #{author} added to the library."
  end

  def create_rental
    puts 'Enter student ID:'
    student_id = gets.chomp.to_i
    student = @library.find_person_by_id(student_id)

    if student.nil?
      puts "Student with ID #{student_id} not found."
    else
      list_available_books
      puts 'select the book:'
      gets.chomp.to_i
      print 'Enter book number to rent: '
      book_number = gets.chomp.to_i
      if book_number >= 1 && book_number <= @library.available_books.length
        book = @library.available_books[book_number - 1]
        rental_date = trigger_rental_date
        rental = Rental.new(rental_date, book, student)
        @library.add_rental(rental)
        puts "#{book.title} rented by #{student.name}."
      end
    end
  end

  def list_rental
    puts 'Enter person ID:'
    person_id = gets.chomp.to_i
    rentals = @library.rentals_by_person_id(person_id)

    if rentals.empty?
      puts "Person with ID #{person_id} has no rentals."
    else
      puts "Rentals for Person with ID #{person_id}:"
      rentals.each do |rental|
        puts "#{rental.book.title} by #{rental.book.author}, Rental Date: #{rental.date}"
      end
    end
  end

  def list_available_books
    puts 'Available books:'
    @library.available_books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.title} by #{book.author}"
    end
  end

  def trigger_rental_date
    print 'Enter rental date (YYYY-MM-DD): '
    gets.chomp
  end
end

app = App.new
app.main
