require 'test_helper'

class UserPlaysInGamesControllerTest < ActionController::TestCase
  setup do
    @user_plays_in_game = user_plays_in_games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_plays_in_games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_plays_in_game" do
    assert_difference('UserPlaysInGame.count') do
      post :create, user_plays_in_game: @user_plays_in_game.attributes
    end

    assert_redirected_to user_plays_in_game_path(assigns(:user_plays_in_game))
  end

  test "should show user_plays_in_game" do
    get :show, id: @user_plays_in_game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_plays_in_game
    assert_response :success
  end

  test "should update user_plays_in_game" do
    put :update, id: @user_plays_in_game, user_plays_in_game: @user_plays_in_game.attributes
    assert_redirected_to user_plays_in_game_path(assigns(:user_plays_in_game))
  end

  test "should destroy user_plays_in_game" do
    assert_difference('UserPlaysInGame.count', -1) do
      delete :destroy, id: @user_plays_in_game
    end

    assert_redirected_to user_plays_in_games_path
  end
end
