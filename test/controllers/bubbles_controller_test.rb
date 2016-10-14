require 'test_helper'


class BubblesControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_redirected_to root_url
  end



end
