Rails.application.routes.draw do

  resources :wikis
  devise_for :users
  root to: "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :charges, only: [:create]
  resources :refunds, only: [:create]

end
