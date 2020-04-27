require 'test_helper'

class TrContactHistoryControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get tr_contact_history_main_url
    assert_response :success
  end

end
