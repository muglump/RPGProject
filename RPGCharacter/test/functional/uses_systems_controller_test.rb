require 'test_helper'

class UsesSystemsControllerTest < ActionController::TestCase
  setup do
    @uses_system = uses_systems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uses_systems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uses_system" do
    assert_difference('UsesSystem.count') do
      post :create, uses_system: @uses_system.attributes
    end

    assert_redirected_to uses_system_path(assigns(:uses_system))
  end

  test "should show uses_system" do
    get :show, id: @uses_system
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @uses_system
    assert_response :success
  end

  test "should update uses_system" do
    put :update, id: @uses_system, uses_system: @uses_system.attributes
    assert_redirected_to uses_system_path(assigns(:uses_system))
  end

  test "should destroy uses_system" do
    assert_difference('UsesSystem.count', -1) do
      delete :destroy, id: @uses_system
    end

    assert_redirected_to uses_systems_path
  end
end
