require_relative 'person'

class Student < Person
  def initialize(id, age, classroom, parent_permission: true, name: 'Unknown')
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
