require 'test_helper'

class TixesControllerTest < ActionController::TestCase
  setup do
    @tix = tixes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tixes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tix" do
    assert_difference('Tix.count') do
      post :create, tix: @tix.attributes
    end

    assert_redirected_to tix_path(assigns(:tix))
  end

  test "should show tix" do
    get :show, id: @tix.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tix.to_param
    assert_response :success
  end

  test "should update tix" do
    put :update, id: @tix.to_param, tix: @tix.attributes
    assert_redirected_to tix_path(assigns(:tix))
  end

  test "should destroy tix" do
    assert_difference('Tix.count', -1) do
      delete :destroy, id: @tix.to_param
    end

    assert_redirected_to tixes_path
  end
end
