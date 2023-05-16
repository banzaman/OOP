require_relative 'person'

class Student < Person
  def initialize(age, name, parent_permission)
    super(age, name, parent_permission: parent_permission)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  attr_reader :classroom
end
