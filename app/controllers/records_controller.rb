class RecordsController < ApplicationController
  def index
    @records = Record.order(created_at: :desc)
  end

  def new
    @record = Record.new
  end
end
