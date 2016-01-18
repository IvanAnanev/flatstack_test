class EventPolicy < ApplicationPolicy
  attr_reader :user, :event

  def initialize(user, event)
    @user = user
    @event = event
  end

  def update?
    event.user == user
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
