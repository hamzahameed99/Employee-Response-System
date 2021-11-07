Rails.application.routes.draw do

  get 'evaluation_forms/index'
  get 'evaluation_forms/show'
  devise_for :users

  get 'home/index'

  #edititng the user
  get 'home/:id/edit', to: 'home#edit', as: 'edit'
  patch 'home/:id', to: 'home#update', as: 'update'

  #delete user
  delete "home/:id" => "home#destroy", as: :user

  #signup for new user
  get 'signup', to: 'home#new'
  post 'signup', to:'home#create'

  #add evaluation_forms
  resources :evaluation_forms

  #delete evaluation form
  delete 'evaluation_froms/:id' => 'evaluation_forms#destroy', as:  :evaluation

  #root path
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
