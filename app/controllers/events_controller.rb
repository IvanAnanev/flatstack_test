class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = current_user.events
    respond_to do |format|
      format.html { render 'events/index'}
      format.json { render json: ActiveModel::ArraySerializer.new(@events, each_serializer: EventSerializer) }
    end
  end

  def new
    @event_new_form = EventNewForm.new
  end

  def create
    @event_new_form      = EventNewForm.new(event_new_form_params)
    @event_new_form.user = current_user.object
    if @event_new_form.save
      redirect_to events_path, notice: "event '#{@event_new_form.name}' was created"
    else
      render :new
    end
  end

  private

  def event_new_form_params
    params.require(:event_new_form).permit(:name, :date, :period, :end_date)
  end
end