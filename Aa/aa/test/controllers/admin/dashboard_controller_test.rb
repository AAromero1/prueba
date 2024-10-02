require "test_helper"

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = users(:admin)
    @event_one = events(:one)
    @event_two = events(:two)
    sign_in @admin
  end

  test "should get index" do
    get admin_dashboard_url
    assert_response :success
    assert_not_nil assigns(:events)
    assert_not_nil assigns(:users)
  end

  test "should list all events and users" do
    get admin_dashboard_url
    assert_response :success
    assert_equal [@event_one, @event_two], assigns(:events)
    assert_equal User.all, assigns(:users)
  end
end
