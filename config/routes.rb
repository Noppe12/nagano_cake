Rails.application.routes.draw do

  root 'public/homes#top'
  get 'about' => 'public/homes#about'
  get 'top' => 'admin/homes#top'

  devise_for :admins, :controllers => {
    :sessions => 'admins/sessions',
    :registrations => 'admins/registrations',
    :passwords => 'admins/passwords'
  }

  devise_for :customers, :controllers => {
    :sessions => 'customers/sessions',
    :passwords => 'customers/passwords',
    :registrations => 'customers/registrations'
  }
  get '/customers/my_page' => 'public/customers#show'
  get '/customers/edit' => 'public/customers#edit'
  patch '/customers' => 'public/customers#update'
  get '/customers/check' => 'public/customers#check'
  patch '/customers/withdraw' => 'public/customers#withdraw'

  resources :cart_items, only: [:index, :update, :destroy, :create], module: "public"
  delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all'

  resources :items, only: [:index, :show], module: "public"

  resources :orders, only: [:index, :show, :new, :create], module: "public"
  post '/orders/confirm' => 'public/orders#confirm'
  get '/orders/complete' => 'public/orders#complete'

  resources :addresses, only: [:index, :edit, :create, :update, :destroy], module: "public"

    namespace :admin do
      resources :customers, only: [:index, :show, :edit, :update]
      resources :items, only: [:index, :new, :create, :show, :edit, :update]
      resources :genres, only: [:index, :create, :edit, :update]
      resources :orders, only: [:show, :update]
      resources :order_details, only: [:update]
    end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
