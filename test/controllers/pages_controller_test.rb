require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get feed" do
    get pages_feed_url
    assert_response :success
  end

  test "should get profile" do
    get pages_profile_url
    assert_response :success
  end

  test "should get admin" do
    get pages_admin_url
    assert_response :success
  end

end
