require 'test_helper'

class BitcoinControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
