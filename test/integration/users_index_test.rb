require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:xi)
    @non_admin = users(:zeng)
  end

  # I dont want this test
  test "index including pagination" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    #assert_select 'div.pagination'
    #User.paginate(page: 1).each do |user|
      #assert_select 'a[href=?]', user_path(user), text: user.name
    #end
  end


  #test case uncomplete
  # Unable to code out all test cases
  # Yet, all ideal functions work as expectation
  # Hu Xi, 26 July, 2015

end