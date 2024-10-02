class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :join]
  before_action :authenticate_user!, except: [:index, :show, :search]

  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true)
    @past_events = @events.where('date < ?', Date.today).order(date: :desc)
    @future_events = @events.where('date >= ?', Date.today).order(date: :asc)
  end

  def show
    @participants = @event.participants
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    @event.user = current_user
    if @event.save
      redirect_to events_path, notice: 'Se ha creado un evento.'
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])

    #verificamos que el que creo el evento lo puede editar
    if @event.user_id == current_user.id

    else
      redirect_to events_path, alert: 'El usuario que creo el evento es el unico que puede editarlo'
    end
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: 'El evento fue actualizado'
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])

    #verificamos que solo el que creo el evento lo pueda destruir
    if @event.user_id == current_user.id
      @event.destroy
      redirect_to events_url, notice: 'El evento fue cancelado'
    
    else
      redirect_to events_path, alert: 'El usuario que creo el evento es el único que puede cancelarlo'
    end
  end

  def join
    @event = Event.find(params[:id])

    if @event.participants.include?(current_user)
      redirect_to events_path, alert: 'Ya te uniste al evento'
      return
    end
    
    # Solo permitir unirse si hay cupos disponibles
    if @event.spots > 0
      @event.participations.create!(user: current_user)
      @event.update!(spots: @event.spots - 1)
      redirect_to events_path, notice: 'Se ha unido excitosamente'
    else
      redirect_to events_path, alert: 'No quedan lugares disponibles'
    end
  end

  def cancel_participation
    @event = Event.find(params[:id])
    participation = @event.participations.find_by(user_id: current_user.id)

    if participation
      participation.destroy
      redirect_to events_path, notice: 'Has cancelado tu participación en el evento.'
      @event.update!(spots: @event.spots + 1)
    else
      redirect_to events_path, alert: 'No estás registrado en este evento.'
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to events_path, alert: 'El evento no existe.'
  end


  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:sport, :date, :time, :location, :spots)
  end

end
