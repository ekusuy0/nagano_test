Rails.application.routes.draw do

  #顧客用
  #URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations'
  }

  root to: "public/homes#top"

  namespace :public do
    resources :customers, only: [:show, :edit, :upadate]
    #退会確認画面
    get 'public/customers/:id/out_check' => 'customers#out_check', as: 'out_check'
    #論理削除用のルーティング
    patch '/customers/:id' => 'customers#out', as: 'out'
  end




  #管理者用
  #URL /admin/sign_in
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
