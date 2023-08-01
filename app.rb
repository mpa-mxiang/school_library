# app.rb
require_relative 'library'

class App
  def initialize
    @library = Library.new
  end

  def main
    puts "Welcome to the Library Management System!"
    loop do
      print_options
      option = gets.chomp.to_i
      break if option == 7

      execute_option(option)
    end
    puts "Thank you for using the Library Management System. Goodbye!"
  end

  private

  def print_options
    puts "\nSelect an option:"
    puts "1. List all books."
    puts "2. List all people."
    puts "3. Create a teacher."
    puts "4. Create a student."
    puts "5. Create a book."
    puts "6. Create a rental."
    puts "7. Quit."
  end

  def execute_option(option)
    case option
    when 1
      list_books
    when 2
      list_people
    when 3
      create_teacher
    when 4
      create_student
    when 5
      create_book
    when 6
      create_rental
    else
      puts "Invalid option. Please try again."
    end
  end

  def list_books
    @library.books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  end

  def list_people
    @library.people.each do |person|
      puts "#{person.name} (#{person.class})"
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
    student = Student.new(name)
    @library.add_person(student)
    puts "Student #{name} created successfully."
  end

  def create_book
    print "Enter book title: "
    title = gets.chomp
    print "Enter author name: "
    author = gets.chomp
    book = Book.new(title, author)
    @library.add_book(book)
    puts "Book '#{title}' by #{author} added to the library."
  end

  def create_rental
    puts "Enter student ID:"
    student_id = gets.chomp.to_i
    student = @library.find_person_by_id(student_id)

    if student.nil?
      puts "Student with ID #{student_id} not found."
    else
      puts "Available books:"
      @library.available_books.each_with_index do |book, index|
        puts "#{index + 1}. #{book.title} by #{book.author}"
      end

      print "Enter book number to rent: "
      book_number = gets.chomp.to_i

      if book_number >= 1 && book_number <= @library.available_books.length
        book = @library.available_books[book_number - 1]
        rental = Rental.new(student, book)
        @library.add_rental(rental)
        puts "#{book.title} rented by #{student.name}."
      else
        puts "Invalid book number. Rental failed."
      end
    end
  end
end

app = App.new
app.main
