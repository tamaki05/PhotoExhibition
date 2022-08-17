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
    patch 'users/withdraw' => 'users#withdraw'
    resources :users, only:[:index, :show, :edit, :update] do
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

  # namespace :public do
  #   get 'exhibitions/index'
  #   get 'exhibitions/show'
  #   get 'exhibitions/new'
  #   get 'exhibitions/edit'

  #   get 'users/index'
  #   get 'users/show'
  #   get 'users/edit'
  #   get 'users/unsubscribe'

    # get 'categories/index'
    # get 'categories/show'

    # get 'favorites/index'

  # end

  # namespace :admin do
  #   get 'categories/index'
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
  # end