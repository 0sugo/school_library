require_relative './base_decorator.rb'
# class for capitalizeDecorator inheriting basedecorator
class CapitalizeDecorator < BaseDecorator
  def correct_name
    super
    @nameable.correct_name.capitalize
  end
end
