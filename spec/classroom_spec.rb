require_relative '../classroom'
require_relative '../student'

RSpec.describe Classroom do
  let(:classroom) { Classroom.new('Math Class') }
  let(:student) { Student.new(16, classroom, name: 'Jane Doe') }

  describe '#initialize' do
    it 'creates a new classroom with the given label' do
      expect(classroom.label).to eq('Math Class')
    end

    it 'initializes students as an empty array' do
      expect(classroom.students).to eq([])
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
