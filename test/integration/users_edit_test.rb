require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:xi)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "",
                                    email: "xi@zeng",
                                    password:              "huxi",
                                    password_confirmation: "zengxi" }
    assert_template 'users/edit'
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    name  = "Xi"
    email = "huxi@zengxi.com"
    patch user_path(@user), user: { name:  name,
                                    email: email,
                                    password:              "Hangzhou",
                                    password_confirmation: "Hangzhou" }
    assert_not flash.empty?
    assert_redirected_to root_url
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
  end

end
