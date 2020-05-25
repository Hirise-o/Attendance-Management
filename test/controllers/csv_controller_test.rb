require 'test_helper'

class CsvControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get csv_create_url
    assert_response :success
  end

end
