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
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

  # namespace :public do
  #   get 'exhibitions/index'
  #   get 'exhibitions/show'
  #   get 'exhibitions/new'
  #   get 'exhibitions/edit'
  # end
