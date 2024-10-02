class RenderController < ApplicationController
  def index
    @past_events = Event.where('date < ?', Date.today).order(date: :desc)
    @future_events = Event.where('date >= ?', Date.today).order(date: :asc)
  end

end
