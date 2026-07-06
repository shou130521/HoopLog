class RecordsController < ApplicationController
  def index
    @records = Record.order(created_at: :desc)
  end
end
