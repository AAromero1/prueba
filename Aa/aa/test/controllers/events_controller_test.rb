# test/controllers/events_controller_test.rb
require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user_one = users(:one)
    @user_two = users(:two)
    @event_one = events(:one)
    @event_two = events(:two)
    @participation = participations(:one)
  end

  test "should get index" do
    sign_in @user_one
    get events_url
    assert_response :success
    assert_select 'h1', 'Eventos en Match Finder'
  end

  test "should get new" do
    sign_in @user_one
    get new_event_url
    assert_response :success
  end

  test "should create event" do
    sign_in @user_one
    assert_difference('Event.count') do
      post events_url, 
           params: { event: { sport: 'Soccer', date: Date.tomorrow, time: '15:00', location: 'Park', spots: 10 } }
    end
    assert_redirected_to events_url
  end

  test "should show event" do
    sign_in @user_one
    get event_url(@event_one)
    assert_response :success
    assert_select 'h1', "#{@event_one.sport} en #{@event_one.location}"
  end

  test "should destroy event if user is the creator" do
    sign_in @user_one
    assert_difference('Event.count', -1) do
      delete event_url(@event_one)
    end
    assert_redirected_to events_url
    assert_equal 'El evento fue cancelado', flash[:notice]
  end

  test "should not destroy event if user is not the creator" do
    sign_in @user_one
    assert_no_difference('Event.count') do
      delete event_url(@event_two)
    end
    assert_redirected_to events_path
    assert_equal 'El usuario que creo el evento es el único que puede cancelarlo', flash[:alert]
  end

  test "should cancel participation successfully" do
    sign_in @user_one
    @event_one.participants << @user_one

    assert_difference('@event_one.participants.count', -1) do
      delete cancel_participation_event_url(@event_one)
    end
    assert_redirected_to events_path
    assert_equal 'Has cancelado tu participación en el evento.', flash[:notice]
    assert_equal 11, @event_one.reload.spots
  end

  test "should update event successfully" do
    sign_in @user_one
    patch event_url(@event_one), params: { event: { sport: 'Basketball', location: 'New Location' } }
    assert_redirected_to events_path
    assert_equal 'El evento fue actualizado', flash[:notice]
    @event_one.reload
    assert_equal 'Basketball', @event_one.sport
    assert_equal 'New Location', @event_one.location
  end

  test "should not update event with invalid params" do
    sign_in @user_one
    patch event_url(@event_one), params: { event: { sport: '', location: 'New Location' } }
    assert_template :edit
    @event_one.reload
    assert_not_equal 'New Location', @event_one.location
  end

  test "should get edit if owner" do
    sign_in @user_one
    get edit_event_url(@event_one)
    assert_response :success
  end

  test "should not get edit if not owner" do
    sign_in @user_two
    get edit_event_url(@event_one)
    assert_redirected_to events_url
    assert_equal 'El usuario que creo el evento es el unico que puede editarlo', flash[:alert]
  end

  test "should join event" do
    sign_in @user_two
    assert_difference('@event_one.participants.count', 1) do
      post join_event_url(@event_one)
    end
    assert_redirected_to events_url
  end

  test "should not join event if already joined" do
    sign_in @user_one
    @event_one.participants << @user_one
    assert_no_difference('@event_one.participants.count') do
      post join_event_url(@event_one)
    end
    assert_redirected_to events_url
    assert_equal 'Ya te uniste al evento', flash[:alert]
  end

  test "should not join event if no spots available" do
    sign_in @user_two
    @event_one.update(spots: 0)
    assert_no_difference('@event_one.participants.count') do
      post join_event_url(@event_one)
    end
    assert_redirected_to events_url
    assert_equal 'No quedan lugares disponibles', flash[:alert]
  end

  test "should not allow unauthenticated user to create event" do
    assert_no_difference('Event.count') do
      post events_url, 
           params: { event: { sport: 'Soccer', date: Date.tomorrow, time: '15:00', location: 'Park', spots: 10 } }
    end
    assert_redirected_to new_user_session_url
  end

  test "should not allow unauthenticated user to edit event" do
    get edit_event_url(@event_one)
    assert_redirected_to new_user_session_url
  end

  test "should not allow unauthenticated user to update event" do
    patch event_url(@event_one), params: { event: { sport: 'Basketball', location: 'New Location' } }
    assert_redirected_to new_user_session_url
  end

  test "should not allow unauthenticated user to destroy event" do
    assert_no_difference('Event.count') do
      delete event_url(@event_one)
    end
    assert_redirected_to new_user_session_url
  end
end
