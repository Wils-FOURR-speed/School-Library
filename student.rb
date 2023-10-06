require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(id, age, classroom, parent_permission: true, name: 'Unknown')
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom&.students&.delete(self)
    @classroom = classroom
    classroom.students << self unless classroom.nil?
  end
end