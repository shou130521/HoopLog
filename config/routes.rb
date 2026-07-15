Rails.application.routes.draw do
  devise_for :users

  root "homes#index"

  resources :records
  resources :favorite_players

  get "up" => "rails/health#show", as: :rails_health_check
end
