require 'test_helper'

class TagTest < ActiveSupport::TestCase


  test "tag fields are all filled" do
      t = Tag.new
      assert_not t.save

      t.name = "name"
      assert_not t.save

      t.content = "Project content"
      assert_not t.save

      #Helper for correctly adding images
      add_image(t)
      # Message help debug the test
      assert t.save, "#{t.name}, #{t.content}, #{t.image}"
  end

end
