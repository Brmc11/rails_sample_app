require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "invalid signup information" do
  #   get signup_path
  #   assert_no_difference 'User.count' do
  #     user = {"name" => "", "email" => "user@invalid", "password" => "foo", "password_confirmation" => "bar"}
  #     post users_path, user
  #   end
  #   assert_template 'users/new'
  # end

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid signup information" do 
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path,  params: { user: { name: "Example User",
                                            email: "user@example.com",
                                            password: "password1",
                                            password_confirmation: "password1" } }
      follow_redirect!
    end
    assert_template 'users/show'
    assert is_logged_in?
    assert_not flash.empty?
  end
end
