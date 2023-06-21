# frozen_string_literal: true

require_relative './baseDecorator'
# class for capitalizeDecorator inheriting basedecorator
class CapitalizeDecorator < BaseDecorator
  def correct_name
    super
    @nameable.correct_name.capitalize
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalizedPerson = CapitalizeDecorator.new(person)
capitalizedPerson.correct_name
