require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get signup(new user)" do
    get "/signup"
    assert_response :success
  end

end
