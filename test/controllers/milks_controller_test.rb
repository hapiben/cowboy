require 'test_helper'

class MilksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @milk = milks(:one)
  end

  test "should get index" do
    get milks_url
    assert_response :success
  end

  test "should get new" do
    get new_milk_url
    assert_response :success
  end

  test "should create milk" do
    assert_difference('Milk.count') do
      post milks_url, params: { milk: { name: @milk.name } }
    end

    assert_redirected_to milk_url(Milk.last)
  end

  test "should show milk" do
    get milk_url(@milk)
    assert_response :success
  end

  test "should get edit" do
    get edit_milk_url(@milk)
    assert_response :success
  end

  test "should update milk" do
    patch milk_url(@milk), params: { milk: { name: @milk.name } }
    assert_redirected_to milk_url(@milk)
  end

  test "should destroy milk" do
    assert_difference('Milk.count', -1) do
      delete milk_url(@milk)
    end

    assert_redirected_to milks_url
  end
end
