require_relative 'base-decorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.Capitalize
  end
end
