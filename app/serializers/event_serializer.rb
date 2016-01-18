class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :start, :url

  def title
    object.name
  end

  def start
    object.date
  end

  def url
    "/events/#{object.id}/edit"
  end
end
