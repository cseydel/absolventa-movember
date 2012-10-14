require 'test_helper'

class BrosControllerTest < ActionController::TestCase
  setup do
    @bro = bros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bro" do
    assert_difference('Bro.count') do
      post :create, bro: { firstname: @bro.firstname, lastname: @bro.lastname }
    end

    assert_redirected_to bro_path(assigns(:bro))
  end

  test "should show bro" do
    get :show, id: @bro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bro
    assert_response :success
  end

  test "should update bro" do
    put :update, id: @bro, bro: { firstname: @bro.firstname, lastname: @bro.lastname }
    assert_redirected_to bro_path(assigns(:bro))
  end

  test "should destroy bro" do
    assert_difference('Bro.count', -1) do
      delete :destroy, id: @bro
    end

    assert_redirected_to bros_path
  end
end
