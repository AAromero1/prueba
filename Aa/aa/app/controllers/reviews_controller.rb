class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event
  def create
    @review = @event.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @event, notice: 'Reseña creada exitosamente.'
    else
      redirect_to @event, alert: 'Hubo un problema creando la reseña.'
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def ensure_participation
    unless @event.participants.include?(current_user)
      redirect_to @event, alert: 'Solo los participantes pueden dejar reseñas.'
    end
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
