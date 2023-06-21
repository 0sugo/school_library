# class for trimmer Decorator inheriting basedecorator
class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize.length > 10 ? name[0..9] : name
  end
end
