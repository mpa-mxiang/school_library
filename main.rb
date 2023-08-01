# main.rb
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'book'

person = Person.new(22, name: 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

classroom = Classroom.new('A1')
student1 = Student.new(16, classroom, name: 'John')
student2 = Student.new(15, classroom, name: 'Alice')

puts student1.classroom.label # Output: A1
puts student2.classroom.label # Output: A1

book1 = Book.new('Title 1', 'Author 1')
book2 = Book.new('Title 2', 'Author 2')

ppl = Person.new(18, name: 'Max')
ppl.rent_book(book1, '2023-07-19')
ppl.rent_book(book2, '2023-07-20')

puts ppl.rentals
