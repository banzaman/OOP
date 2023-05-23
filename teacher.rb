require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, name, specialization)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    { type: 'Person', name: @name, age: @age, specialization: @specialization, person_id: @id }.to_json(*args)      
  end

end
