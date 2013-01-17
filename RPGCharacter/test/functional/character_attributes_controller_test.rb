require 'test_helper'

class CharacterAttributesControllerTest < ActionController::TestCase
  setup do
    @character_attribute = character_attributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:character_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create character_attribute" do
    assert_difference('CharacterAttribute.count') do
      post :create, character_attribute: @character_attribute.attributes
    end

    assert_redirected_to character_attribute_path(assigns(:character_attribute))
  end

  test "should show character_attribute" do
    get :show, id: @character_attribute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @character_attribute
    assert_response :success
  end

  test "should update character_attribute" do
    put :update, id: @character_attribute, character_attribute: @character_attribute.attributes
    assert_redirected_to character_attribute_path(assigns(:character_attribute))
  end

  test "should destroy character_attribute" do
    assert_difference('CharacterAttribute.count', -1) do
      delete :destroy, id: @character_attribute
    end

    assert_redirected_to character_attributes_path
  end
end
