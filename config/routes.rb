Rails.application.routes.draw do
  devise_for :users

  root "homes#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
