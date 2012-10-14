require 'test_helper'

class MoustachesControllerTest < ActionController::TestCase
  setup do
    @moustach = moustaches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moustaches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moustach" do
    assert_difference('Moustache.count') do
      post :create, moustach: { description: @moustach.description, title: @moustach.title }
    end

    assert_redirected_to moustach_path(assigns(:moustach))
  end

  test "should show moustach" do
    get :show, id: @moustach
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moustach
    assert_response :success
  end

  test "should update moustach" do
    put :update, id: @moustach, moustach: { description: @moustach.description, title: @moustach.title }
    assert_redirected_to moustach_path(assigns(:moustach))
  end

  test "should destroy moustach" do
    assert_difference('Moustache.count', -1) do
      delete :destroy, id: @moustach
    end

    assert_redirected_to moustaches_path
  end
end
