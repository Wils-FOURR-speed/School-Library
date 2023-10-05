require_relative 'nameable'

class Person < Nameable
  attr_accessor :age, :rentals
  attr_reader :id, :classroom

  def initialize(id, age, parent_permission: true, name: 'Unknown')
    super(name)
    @id = id
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    @classroom = nil
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    name
  end

  def add_rental(rental)
    @rentals << rental
  end

  def remove_rental(rental)
    @rentals.delete(rental)
  end

  def assign_classroom(classroom)
    @classroom&.students&.delete(self)
    @classroom = classroom
    classroom.students << self unless classroom.nil?
  end

  private

  def of_age?
    @age >= 18
  end
end
