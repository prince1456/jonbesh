Rails.application.routes.draw do
  resources :reports do
    resources :comments
  end
  resources :pics
  resources :images
  resources :users
  root 'pics#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
