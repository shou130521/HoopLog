Rails.application.routes.draw do
  devise_for :users

  root "homes#index"

  resources :records

  get "up" => "rails/health#show", as: :rails_health_check
end
