Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: 'usars/registrations' }

  root to: "items#index"
  resources :items
  resources :users, only: [:create]
  

end
 