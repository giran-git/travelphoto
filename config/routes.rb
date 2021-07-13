Rails.application.routes.draw do
  root :to => "homes#top"
  get 'home/about' =>  'homes#about'
    
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
