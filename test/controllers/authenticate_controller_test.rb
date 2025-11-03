require "test_helper"

class AuthenticateControllerTest < ActionDispatch::IntegrationTest
  test "should get signup" do
    get authenticate_signup_url
    assert_response :success
  end

  test "should get login" do
    get authenticate_login_url
    assert_response :success
  end
end
