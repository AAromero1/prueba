# app/controllers/admin/events_controller.rb
module Admin
  class EventsController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_only
    before_action :set_event, only: [:edit, :update, :destroy]

    def index
      @events = Event.all
    end

    def edit
    end

    def update
      if @event.update(event_params)
        redirect_to admin_dashboard_path, notice: 'Evento actualizado.'
      else
        render :edit
      end
    end

    def destroy
      @event.destroy
      redirect_to admin_dashboard_path, notice: 'Evento eliminado.'
    end

    private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:sport, :date, :time, :location, :spots)
    end

    def admin_only
      unless current_user.admin?
        redirect_to root_path, alert: "Acceso denegado."
      end
    end
  end
end

