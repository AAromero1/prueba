# test/controllers/render_controller_test.rb
require 'test_helper'

class RenderControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @event_past = events(:two) # evento pasado
    @event_future = events(:one) # evento futuro
  end

  test "should get index and display future events" do
    get root_path
    assert_response :success
    assert_select 'h2', 'Futuros Eventos'
    assert_select 'td', @event_future.sport
  end

  
  test "should get index and display past events" do
    get root_path
    assert_response :success
    assert_select 'h2', 'Eventos Pasados'
    assert_select 'td', @event_past.sport
  end
end
