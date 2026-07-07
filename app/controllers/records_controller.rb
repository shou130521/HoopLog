class RecordsController < ApplicationController
  before_action :authenticate_user!

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
    @record = Record.find(params[:id])
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])

    if @record.update(record_params)
      redirect_to records_path, notice: "観戦記録を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy

    redirect_to records_path, notice: "観戦記録を削除しました。"
  end

  private

  def record_params
    params.require(:record).permit(:title, :body, :watched_on)
  end
end
