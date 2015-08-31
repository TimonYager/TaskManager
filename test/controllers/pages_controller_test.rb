require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get queries" do
    get :queries
    assert_response :success
  end

end
