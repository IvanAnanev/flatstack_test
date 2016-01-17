class UserDecorator < Draper::Decorator
  delegate_all

  def name
    object.name.present? ? object.name : object.email
  end

end
