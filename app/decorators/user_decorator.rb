class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    object.name.present? ? object.name : object.email
  end

end
