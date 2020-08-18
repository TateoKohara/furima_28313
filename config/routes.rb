Rails.application.routes.draw do
  
  # devise_for :users
  devise_for :users, controllers: { registrations: 'usars/registrations' }

  root to: "items#index"
  resources :items, only: [:index, :new, :create]
  resources :users, only: [:create]
  # post 'users', to: 'devise/registrations#create'

end
 