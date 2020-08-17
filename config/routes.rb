Rails.application.routes.draw do
  
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :new]
  # get 'items', to: 'items#checked'
  

  
  
end
 