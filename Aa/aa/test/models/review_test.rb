# test/models/review_test.rb
require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @event = events(:one)
    @review = Review.new(user: @user, event: @event, rating: 4, comment: "Great event!")
  end

  test "should be valid with all attributes" do
    assert @review.valid?
  end

  test "should be invalid without a rating" do
    @review.rating = nil
    assert_not @review.valid?
  end

  test "should be invalid without a comment" do
    @review.comment = nil
    assert_not @review.valid?
  end

  test "rating should be between 1 and 5" do
    @review.rating = 6
    assert_not @review.valid?
    @review.rating = 0
    assert_not @review.valid?
  end

end
