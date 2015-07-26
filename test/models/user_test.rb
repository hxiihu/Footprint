require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	 @user = User.new(name: "huxi", email: "huxi@example.com", 
  	 				  password: "zengxi", password_confirmation: "zengxi")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present (nonblank)" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "email address should be present (nonblank)" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  
test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
end

end
