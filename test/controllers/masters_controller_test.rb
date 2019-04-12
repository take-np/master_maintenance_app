require 'test_helper'

class MastersControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get masters_top_url
    assert_response :success
  end

end
