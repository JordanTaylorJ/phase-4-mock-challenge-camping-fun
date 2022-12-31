Rails.application.routes.draw do
  resources :signups, only: [:create] 
  resources :campers, only: [:show, :index, :create] 
  #  resources :activities, only: [:show, :index]
  #end
  resources :activities, only: [:index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
