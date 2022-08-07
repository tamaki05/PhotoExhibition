Rails.application.routes.draw do

#顧客用
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

#管理者側
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root :to => 'homes#top'
    get "about" => 'homes#about'
    resources :exhibitions, only:[:index, :new, :create, :show, :edit, :update, :destroy]
    get 'users/unsubscribe' => 'users#unsubscribe'
    patch 'users/withdraw' => 'users#withdraw'
    resources :users, only:[:index, :show, :edit, :update]
  end

  namespace :admin do
    resources :users, only:[:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

  # namespace :public do
  #   get 'exhibitions/index'
  #   get 'exhibitions/show'
  #   get 'exhibitions/new'
  #   get 'exhibitions/edit'
  # end

  # namespace :public do
  #   get 'users/index'
  #   get 'users/show'
  #   get 'users/edit'
  #   get 'users/unsubscribe'
  # end

  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'