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


  scope module: :public do
    root :to => "homes#top"
    get 'home/about' =>  'homes#about'
    get 'items/index'
    resources :posts do
      resource :favorites, only: [:create, :destroy]
    end
    get 'locations/index'
    resources :users, only: [:index, :new, :show, :edit, :update] do
    member do
      get :following, :followers
    end

  end

  devise_for :users
  end

end
