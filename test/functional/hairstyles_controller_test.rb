require 'test_helper'

class HairstylesControllerTest < ActionController::TestCase
  setup do
    @hairstyle = hairstyles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hairstyles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hairstyle" do
    assert_difference('Hairstyle.count') do
      post :create, hairstyle: { count: @hairstyle.count, name: @hairstyle.name }
    end

    assert_redirected_to hairstyle_path(assigns(:hairstyle))
  end

  test "should show hairstyle" do
    get :show, id: @hairstyle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hairstyle
    assert_response :success
  end

  test "should update hairstyle" do
    put :update, id: @hairstyle, hairstyle: { count: @hairstyle.count, name: @hairstyle.name }
    assert_redirected_to hairstyle_path(assigns(:hairstyle))
  end

  test "should destroy hairstyle" do
    assert_difference('Hairstyle.count', -1) do
      delete :destroy, id: @hairstyle
    end

    assert_redirected_to hairstyles_path
  end
end
