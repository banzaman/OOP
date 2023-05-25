require_relative '../nameable'

class PersonWithoutCorrectName < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
  end
end

describe Nameable do
  it 'check allert when correct_name method not present in class' do
    person = PersonWithoutCorrectName.new(33, 'John')
    expect { person.correct_name }.to raise_error('You must implement the correct_name method')
  end
end
