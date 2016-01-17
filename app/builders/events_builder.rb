class EventsBuilder
  def initialize(user, name, date, period, end_date)
    @user     = user
    @name     = name
    @date     = date
    @period   = period
    @end_date = end_date
  end

  def build
    case @period
      when 'daily'
        repeat_event_create(:day)
      when 'weekly'
        repeat_event_create(:week)
      when 'monthly'
        repeat_event_create(:month)
      when 'yearly'
        repeat_event_create(:year)
      else
        Event.create(user_id: @user.id, name: @name, date: @date)
    end
  end

  private

  def repeat_event_create(type)
    i = 0
    while ((date = @date + i.try(type)) <= @end_date)
      Event.create(user_id: @user.id, name: @name, date: date)
      i += 1
    end
  end

end