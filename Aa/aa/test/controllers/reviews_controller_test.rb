# test/controllers/reviews_controller_test.rb
require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @event = events(:one)
    @participant = users(:one)  # Asume que el usuario :one es un participante del evento
    @non_participant = users(:two)  # Asume que el usuario :two no es un participante del evento
    @event.participants << @participant  # Asegúrate de que @participant es un participante del evento
  end

  test "should create review if user is a participant" do
    sign_in @participant
    assert_difference('Review.count') do
      post event_reviews_path(@event), params: { review: { rating: 5, comment: "Great event!" } }
    end
    assert_redirected_to event_path(@event)
  end

end
