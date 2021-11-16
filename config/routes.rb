Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'evaluation_forms/index'
  get 'evaluation_forms/show'
  devise_for :users

  get 'users/index'

  #edititng the user
  get 'users/:id/edit', to: 'users#edit', as: 'edit'
  patch 'users/:id', to: 'users#update', as: 'update'

  #delete user
  delete "users/:id" => "users#destroy", as: :user

  #Create user
  get 'signup', to: 'users#new'
  post 'signup', to:'users#create'

  #add evaluation_forms
  resources :evaluation_forms

  #delete evaluation form
  delete 'evaluation_froms/:id' => 'evaluation_forms#destroy', as:  :evaluation

  #add query
  resources :query

  #delete question
  delete 'query/:id' => 'query#destroy', as:  :query_delete
  #root path
  root to: "users#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
