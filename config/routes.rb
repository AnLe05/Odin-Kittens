Rails.application.routes.draw do
  resources :kittens 
  root "kittens#index"
  get "up" => "rails/health#show", as: :rails_health_check

end
