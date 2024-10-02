require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = users(:one)
  end

  test "should be valid with all attributes" do
    user = User.new(
      email: 'newuser@example.com',
      password: 'password',
      password_confirmation: 'password'
    )
    assert user.valid?
  end

  test "should be invalid without an email" do
    user = User.new(
      password: 'password',
      password_confirmation: 'password'
    )
    assert_not user.valid?
    assert_includes user.errors[:email], "can't be blank"
  end
  
  test "should be invalid with a duplicate email" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
    assert_includes duplicate_user.errors[:email], "has already been taken"
  end

  test "should have many events" do
    assert_respond_to @user, :events
  end

  test "should have many participations" do
    assert_respond_to @user, :participations
  end

  test "should have many reviews" do
    assert_respond_to @user, :reviews
  end
end
