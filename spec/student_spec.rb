require 'rspec'
require_relative '../student'
require_relative '../classroom'

describe Student do
  describe '#initialize' do
    it 'creates a student with the given age, name, and parent permission' do
      student = Student.new(16, 'John', true)
      expect(student.age).to eq(16)
      expect(student.name).to eq('John')
      expect(student.instance_variable_get(:@parent_permission)).to eq(true)
    end
  end

  describe '#play_hooky' do
    it 'returns a string with the shrugging person emoji' do
      student = Student.new(16, 'John', true)
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end

  describe '#classroom=' do
    it 'assigns the classroom to the student and adds the student to the classroom' do
      classroom = Classroom.new('Math')
      student = Student.new(16, 'John', true)
      student.classroom = classroom
      expect(student.classroom).to eq(classroom)
      expect(classroom.students).to include(student)
    end

    it 'does not add the student to the classroom if they are already in the classroom' do
      classroom = Classroom.new('Math')
      student = Student.new(16, 'John', true)
      student.classroom = classroom
      student.classroom = classroom
      expect(student.classroom).to eq(classroom)
      expect(classroom.students.count(student)).to eq(1)
    end
  end
end
