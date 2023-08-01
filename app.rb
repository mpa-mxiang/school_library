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

  # Implement the methods for each option here.
  # For example: list_books, list_people, create_teacher, create_student, create_book, create_rental, etc.
end

app = App.new
app.main
