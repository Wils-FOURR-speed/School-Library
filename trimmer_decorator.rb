require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  MAX_LENGTH = 10

  def correct_name
    name = @nameable.correct_name
    name.length > MAX_LENGTH ? name[0...MAX_LENGTH] : name
  end
end
