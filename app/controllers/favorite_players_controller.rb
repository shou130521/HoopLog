class FavoritePlayersController < ApplicationController
  before_action :authenticate_user!
  
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
  end

  def destroy
  end

  private

  def favorite_player_params
    params.require(:favorite_player).permit(:name, :team, :position)
  end
end
