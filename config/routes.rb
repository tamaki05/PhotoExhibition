Rails.application.routes.draw do

#顧客用
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
# ゲストログイン用
  devise_scope :user do
    post 'users/guest_sign_in' => 'public/sessions#guest_sign_in'
  end

#管理者側
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root :to => 'homes#top'
    get "about" => 'homes#about'
    resources :exhibitions, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
      member do
        get :comments
      end
      collection do
        get 'search'
      end
    end
    get 'users/unsubscribe' => 'users#unsubscribe'
    get 'users/timeline' => 'users#timeline'
    patch 'users/withdraw' => 'users#withdraw'
    patch 'users/release' => 'users#release'
    patch 'users/nonrelease' => 'users#nonrelease'
    resources :users, only:[:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
        get 'followings' => 'relationships#followings', as: 'followings'
        get 'followers' => 'relationships#followers', as: 'followers'
      member do
        get :favorites
        get :exhibitions
      end
    end
    resources :categories, only:[:index, :show]
  end


  namespace :admin do
    resources :users, only:[:index, :show, :edit, :update] do
      member do
        get :comments
      end
    end
    resources :comments, only:[:destroy]
    resources :categories, only:[:index, :create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
