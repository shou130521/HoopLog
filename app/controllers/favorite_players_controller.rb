class FavoritePlayersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @favorite_players = current_user.favorite_players
  end

  def new
    @favorite_player = FavoritePlayer.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end