require 'test_helper'

class MsgsControllerTest < ActionDispatch::IntegrationTest
  test "should get message" do
    get msgs_message_url
    assert_response :success
  end

end
