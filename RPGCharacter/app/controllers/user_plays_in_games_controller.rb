class UserPlaysInGamesController < ApplicationController
  # GET /user_plays_in_games
  # GET /user_plays_in_games.json
  def index
    @user_plays_in_games = UserPlaysInGame.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_plays_in_games }
    end
  end

  # GET /user_plays_in_games/1
  # GET /user_plays_in_games/1.json
  def show
    @user_plays_in_game = UserPlaysInGame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_plays_in_game }
    end
  end

  # GET /user_plays_in_games/new
  # GET /user_plays_in_games/new.json
  def new
    @user_plays_in_game = UserPlaysInGame.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_plays_in_game }
    end
  end

  # GET /user_plays_in_games/1/edit
  def edit
    @user_plays_in_game = UserPlaysInGame.find(params[:id])
  end

  # POST /user_plays_in_games
  # POST /user_plays_in_games.json
  def create
    @user_plays_in_game = UserPlaysInGame.new(params[:user_plays_in_game])

    respond_to do |format|
      if @user_plays_in_game.save
        format.html { redirect_to @user_plays_in_game, notice: 'User plays in game was successfully created.' }
        format.json { render json: @user_plays_in_game, status: :created, location: @user_plays_in_game }
      else
        format.html { render action: "new" }
        format.json { render json: @user_plays_in_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_plays_in_games/1
  # PUT /user_plays_in_games/1.json
  def update
    @user_plays_in_game = UserPlaysInGame.find(params[:id])

    respond_to do |format|
      if @user_plays_in_game.update_attributes(params[:user_plays_in_game])
        format.html { redirect_to @user_plays_in_game, notice: 'User plays in game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_plays_in_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_plays_in_games/1
  # DELETE /user_plays_in_games/1.json
  def destroy
    @user_plays_in_game = UserPlaysInGame.find(params[:id])
    @user_plays_in_game.destroy

    respond_to do |format|
      format.html { redirect_to user_plays_in_games_url }
      format.json { head :no_content }
    end
  end
end
