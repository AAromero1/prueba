# test/controllers/users_controller_test.rb
require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @admin = users(:admin)  # Asume que tienes un usuario con rol de administrador en tus fixtures
    @non_admin = users(:two)  # Asume que tienes un usuario regular en tus fixtures
  end

  test "should get index" do
    sign_in @admin
    get users_url
    assert_response :success
    assert_select 'h1', 'Lista de Usuarios'
  end
end
