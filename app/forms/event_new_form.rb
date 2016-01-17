class EventNewForm
  include ActiveModel::Model
  include Virtus

  attribute :name,     String
  attribute :date,     Date
  attribute :period,   String
  attribute :end_date, Date

  attr_accessor :user

  validates :name, presence: true
  validates :date, presence: true
  validates :period, inclusion: {in: %w(no_repeat daily weekly monthly yearly)}, presence: true
  validates :end_date, presence: true, unless: Proc.new { |e| e.period  == 'no_repeat'}

  validate  :date_cannot_be_in_the_past, :end_date_cannot_be_less_than_date

  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

  def end_date_cannot_be_less_than_date
    if date.present? && end_date.present? && (period != 'no_repeat') && (end_date <= date)
      errors.add(:end_date, "can't be less than date")
    end
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private

  def persist!
    raise 1
  end

end