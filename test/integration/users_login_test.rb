require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
#$ bundle exec rake test TEST=test/integration/users_login_test.rb
  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: "", password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end