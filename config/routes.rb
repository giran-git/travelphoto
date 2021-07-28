Rails.application.routes.draw do
  namespace :admin do
    root :to => 'homes#index'
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

  #ゲストユーザー
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
  end

  scope module: :public do
    root :to => "homes#top"
    get 'home/about' =>  'homes#about'
    post "posts/creat" => "posts#creat"
    resources :posts, only: [:index, :show, :new, :edit, :create, :destroy, :update] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:index, :new, :show, :edit, :update] do
       resource :relationships, only: [:create, :destroy]
        get :followings, on: :member
        get :followers, on: :member
    end
  end
end
