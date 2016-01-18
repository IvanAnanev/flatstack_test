class Event < ActiveRecord::Base
  belongs_to :user

  validates :name, :date, presence: true
end
