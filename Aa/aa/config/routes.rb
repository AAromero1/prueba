Rails.application.routes.draw do
  get 'reviews/create'
  get 'pages/chat'
  namespace :admin do
    get 'events/index'
    get 'events/edit'
    get 'events/update'
    get 'events/destroy'
    get 'users/index'
    get 'users/destroy'
    get 'dashboard/index'
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  devise_scope :user do
    put 'users/update_profile_picture', to: 'users/registrations#update_profile_picture', as: :update_profile_picture
  end

  root "render#index"
  
  post '/events/:id/join', to:'events#join'

  get 'events', to: 'events#index', as: 'events'
  get 'events/new', to: 'events#new', as: 'new_event'
  post 'events', to: 'events#create'
  get 'events/:id', to: 'events#show', as: 'event'
  get 'events/:id/edit', to: 'events#edit', as: 'edit_event'
  patch 'events/:id', to: 'events#update'
  delete 'events/:id', to: 'events#destroy'
  post 'events/:id/join', to: 'events#join', as: 'join_event'
  delete 'events/:id/cancel_participation', to: 'events#cancel_participation', as: 'cancel_participation_event'
  get 'users', to: 'users#index', as: 'users'
  get 'pages/test', to: 'pages#test'


  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :events
    resources :users, only: [:index, :destroy]
  end

  resources :messages, only: [:create, :destroy]

  resources :events do
    resources :reviews, only: [:create]
  end
end