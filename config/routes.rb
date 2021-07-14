Rails.application.routes.draw do
  namespace :admin do
    root :to => 'homess#top'
   get 'genres/edit'
   get 'genres/index'
  end
  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations',
  }

  root :to => "users/homes#top"
  get 'users/home/about' =>  'users/homes#about'

  devise_for :users

  resources :users, only: [:index, :new, :show, :edit, :update] do
    member do
      get :following, :followers
    end
  end

  resources :posts do
    resource :favorites, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]
end
