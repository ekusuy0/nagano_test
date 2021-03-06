# == Route Map
#

Rails.application.routes.draw do

  namespace :admin do
    resources :ordered_items, only: [:update]
  end
  root to: "public/homes#top"

  #顧客用
  #URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }

  namespace :public do
    resources :customers, only: [:show, :edit, :upadate]
    resources :items, only: [:index, :show]
    resources :orders, only: [:new, :index, :show, :create] do
      collection do
        post 'confirm'
        get 'conplete'
      end
    end
    resources :cart_items, only: [:index, :update, :create, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    #退会確認画面
    get 'customers/:id/out_check' => 'customers#out_check', as: 'out_check'
    #論理削除用のルーティング
    patch 'customers/:id' => 'customers#out', as: 'out'
  end




  #管理者用
  #URL /admin/sign_in
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  get 'admin' => 'admin/homes#top'
  namespace :admin do
    resources :items, except: [:destroy]
    resources :orders, only: [:show, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
