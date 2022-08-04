require "test_helper"

class Public::ExhibitionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_exhibitions_index_url
    assert_response :success
  end

  test "should get show" do
    get public_exhibitions_show_url
    assert_response :success
  end

  test "should get new" do
    get public_exhibitions_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_exhibitions_edit_url
    assert_response :success
  end
end
