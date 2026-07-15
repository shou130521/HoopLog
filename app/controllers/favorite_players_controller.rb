class FavoritePlayersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favorite_player, only: %i[show edit update destroy]
  
  def index
    @favorite_players = current_user.favorite_players
  end

  def new
    @favorite_player = FavoritePlayer.new
  end

  def create
    @favorite_player = current_user.favorite_players.build(favorite_player_params)

    if @favorite_player.save
      redirect_to favorite_players_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @favorite_player.update(favorite_player_params)
      redirect_to favorite_player_path(@favorite_player)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @favorite_player.destroy
    redirect_to favorite_players_path
  end

  private

  def set_favorite_player
    @favorite_player = current_user.favorite_players.find(params[:id])
  end

  def favorite_player_params
    params.require(:favorite_player).permit(:name, :team, :position)
  end
end
