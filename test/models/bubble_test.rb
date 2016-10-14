require 'test_helper'

class BubbleTest < ActiveSupport::TestCase

  test "should not save bubble without text" do
      bubble = Bubble.new
      assert_not bubble.save
  end

  test "bubble should have string smaller than 20" do
      bubble = Bubble.new
      b_text = "a" * 21
      bubble.text = b_text
      assert_not bubble.save
  end

end
