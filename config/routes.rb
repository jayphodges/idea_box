Rails.application.routes.draw do

  root "categories#index"

  resources :users, only: [:new, :create, :show]
  resources :ideas
  resources :categories
  resources :images

  get "/signup",    to: 'users#new'
  delete "/logout", to: 'sessions#destroy'
  get "/login",     to: 'sessions#new'
  post "/login",    to: 'sessions#create'

  namespace :admin do
    resources :categories, only: ['index']
    resources :images
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
