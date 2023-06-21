require_relative './nameable.rb'
# Class for basedecorator extending Nameable
class BaseDecorator < Nameable
  def initialize(nameable)
    super
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
