require 'test_helper'

class Admin::ScreensControllerTest < ActionController::TestCase
  setup do
    @admin_screen = admin_screens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_screens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_screen" do
    assert_difference('Admin::Screen.count') do
      post :create, admin_screen: { avaiable: @admin_screen.avaiable, seats_string: @admin_screen.seats_string }
    end

    assert_redirected_to admin_screen_path(assigns(:admin_screen))
  end

  test "should show admin_screen" do
    get :show, id: @admin_screen
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_screen
    assert_response :success
  end

  test "should update admin_screen" do
    patch :update, id: @admin_screen, admin_screen: { avaiable: @admin_screen.avaiable, seats_string: @admin_screen.seats_string }
    assert_redirected_to admin_screen_path(assigns(:admin_screen))
  end

  test "should destroy admin_screen" do
    assert_difference('Admin::Screen.count', -1) do
      delete :destroy, id: @admin_screen
    end

    assert_redirected_to admin_screens_path
  end
end
