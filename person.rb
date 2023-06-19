# Define class person
class Person
  def initialize(name = 'unknown', age = nil, parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def of_age?
    @age.to_i >= 18
  end

  def can_use_services?
    return true if of_age || @parent_permission

    false
  end
end
