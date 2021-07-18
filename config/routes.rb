Rails.application.routes.draw do
  namespace :admin do
    root :to => 'homess#top'
    resources :genres, only: [:index, :create, :edit, :update]
  end

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations',
  }

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations',
  }

  scope module: :public do
    root :to => "homes#top"
    get 'home/about' =>  'homes#about'
    resources :posts, only: [:index, :new] do
      resource :favorites, only: [:create, :destroy]
    end
    get 'locations/index'
    resources :users, only: [:index, :new, :show, :edit, :update] do
    member do
      get :following, :followers
    end
  end
end


end
