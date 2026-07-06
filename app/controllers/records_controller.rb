class RecordsController < ApplicationController
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

  private

  def record_params
    params.require(:record).permit(:title, :body, :watched_on)
  end
end
