require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:xi)
  end

  test "should get signup" do
    get :signup
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

end
