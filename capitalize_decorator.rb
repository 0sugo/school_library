require_relative './base_decorator'
# class for capitalizeDecorator inheriting basedecorator
class CapitalizeDecorator < BaseDecorator
  def correct_name
    super&.capitalize
  end
end
