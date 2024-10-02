require "test_helper"

class ParticipationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = users(:one)
    @event = events(:one)
    @participation = participations(:one)
  end

  test "should be valid with all attributes" do
    participation = Participation.new(user: @user, event: @event)
    assert participation.valid?
  end

  test "should be invalid without a user" do
    participation = Participation.new(event: @event)
    assert_not participation.valid?
  end

  test "should be invalid without an event" do
    participation = Participation.new(user: @user)
    assert_not participation.valid?
  end
end
