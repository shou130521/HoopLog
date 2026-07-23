class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_record, only: %i[show edit update destroy]
  before_action :correct_user, only: %i[edit update destroy]
  before_action :set_favorite_players, only: %i[new create edit update]

  def index
    @records = Record.order(created_at: :desc)
  end

  def new
    @record = Record.new
  end

  def create
    @record = current_user.records.build(record_params)

    if @record.save
      redirect_to records_path, notice: "観戦記録を投稿しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @record.update(record_params)
      redirect_to records_path, notice: "観戦記録を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @record.destroy

    redirect_to records_path, notice: "観戦記録を削除しました。"
  end

  private

  def set_record
    @record = Record.find(params[:id])
  end

  def set_favorite_players
    @favorite_players = current_user.favorite_players
  end

  def record_params
    params.require(:record).permit(:title, :body, :watched_on, favorite_player_ids: [])
  end

  def correct_user
    redirect_to records_path, alert: "権限がありません。" unless @record.user == current_user
  end
end
