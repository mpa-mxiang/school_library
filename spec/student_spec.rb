require_relative '../student'
require_relative '../classroom'

RSpec.describe Student do
  describe '#initialize' do
    it 'creates a student object with the given age, classroom, and name' do
      classroom = Classroom.new('C1')
      student = Student.new(17, classroom, name: 'Alice')
      expect(student.age).to eq(17)
      expect(student.classroom).to eq(classroom)
      expect(student.name).to eq('Alice')
    end
  end

  describe '#play_hooky' do
    it 'returns a string of ¯(ツ)/¯' do
      classroom = Classroom.new('C1')
      student = Student.new(17, classroom)
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end
end
