require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "",
                               email: "huxi@zengxi",
                               password:              "xi",
                               password_confirmation: "xi" }
    end
    assert_template 'users/signup'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name:  "huxi",
                                            email: "huxi@footprint.com",
                                            password:              "footprint",
                                            password_confirmation: "footprint" }
    end
    assert_template 'users/show'
    assert is_logged_in?
  end

end