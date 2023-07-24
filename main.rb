# main.rb
require_relative 'person'
require_relative 'student'
require_relative 'teacher'

# Create instances of Person, Student, and Teacher
person = Person.new(25)
student = Student.new(16, 'Math')
teacher = Teacher.new(35, 'Physics', 'Mr. Smith')

# Output some information
puts 'Person Info:'
puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
puts "Can use services? #{person.can_use_services?}"

puts "\nStudent Info:"
puts "ID: #{student.id}, Name: #{student.name}, Age: #{student.age}, Classroom: #{student.classroom}"
puts "Can use services? #{student.can_use_services?}"
puts "Playing hooky: #{student.play_hooky}"

puts "\nTeacher Info:"
puts "ID: #{teacher.id}, Name: #{teacher.name}, Age: #{teacher.age}, Specialization: #{teacher.specialization}"
puts "Can use services? #{teacher.can_use_services?}"
