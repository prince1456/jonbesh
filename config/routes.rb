Rails.application.routes.draw do
  resources :pics
  resources :images
  resources :users
  root 'pics#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
