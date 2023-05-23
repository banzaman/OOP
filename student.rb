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

  def to_json(*args)
    { type: 'Student', name: @name, age: @age, parent_permission: @parent_permission, person_id: @id }.to_json(*args)      
  end

  attr_reader :classroom
end
