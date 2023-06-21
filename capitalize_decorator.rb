require_relative "./baseDecorator.rb"

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
