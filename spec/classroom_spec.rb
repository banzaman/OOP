require_relative '../classroom'
require_relative '../student'
require 'rspec'

describe Classroom do
  describe '#initialize' do
    it 'creates a new Classroom object' do
      classroom = Classroom.new('Class A')
      expect(classroom).to be_an_instance_of(Classroom)
    end

    it 'sets the label attribute' do
      classroom = Classroom.new('Class A')
      expect(classroom.label).to eq('Class A')
    end

    it 'sets the students attribute to an empty array' do
      classroom = Classroom.new('Class A')
      expect(classroom.students).to eq([])
    end
  end

  describe '#add_student' do
    it 'adds a new student to the students attribute' do
      classroom = Classroom.new('Class A')
      student = Student.new(16, 'John', true)
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it 'sets the classroom attribute of the student' do
      classroom = Classroom.new('Class A')
      student = Student.new(16, 'John', true)
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
