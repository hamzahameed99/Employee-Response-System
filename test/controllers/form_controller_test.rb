require "test_helper"

class FormControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get form_index_url
    assert_response :success
  end

  test "should get show" do
    get form_show_url
    assert_response :success
  end
end
