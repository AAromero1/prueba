require "test_helper"

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @user = users(:one)
    @event = events(:one)
  end

  test "should be valid with all attributes" do
    event = Event.new(
      sport: 'Basketball',
      date: '2024-07-01',
      time: '19:00:00',
      location: 'Providencia',
      spots: 5,
      user: @user
    )
    assert event.valid?
  end

  test "should be invalid without a sport" do
    event = Event.new(
      date: '2024-07-01',
      time: '19:00:00',
      location: 'Providencia',
      spots: 5,
      user: @user
    )
    assert_not event.valid?
    assert_includes event.errors[:sport], "can't be blank"
  end

  test "should be invalid without a time" do
    event = Event.new(
      sport: 'Basketball',
      date: '2024-07-01',
      location: 'Providencia',
      spots: 5,
      user: @user
    )
     assert_not event.valid?
    assert_includes event.errors[:time], "can't be blank"
  end
end