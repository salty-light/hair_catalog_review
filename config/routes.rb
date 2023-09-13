Rails.application.routes.draw do

  devise_for :admins, skip: [:registrations, :passwords] , controllers: {
  sessions: "admin/sessions"
   }
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
   }
      scope module: :public do
      get 'top' => 'homes#top'
      get "/about" => "homes#about", as: "about"
      resources :review, only: [:index, :edit, :create, :update, :destroy]


      get "customers/:id" => "customers#show", as: :customer
      patch "customers/:id" => "customers#update", as: :customer_update
      get "customers/:id/edit" => "customers#edit", as: :customer_edit
      get "customers/confirm" => "customers#confirm"
      patch "customers/withdraw" => "customers#withdraw"
      resources :hair_catalogs, only: [:index, :show]
      get "reviews/:id"=> "reviews#update"
      delete "hair_catalogs/:hair_id/reviews/:id"=>  "reviews#destroy"
      get "hair_catalogs/:id/reviews/"=>"reviews#edit"
      patch "items/:item_id/reviews"=>"reviews#create"
    end

    namespace :admin do
      root to: 'homes#top'

      resources :customers, only: [:index, :show, :edit, :update]
      resources :hair_longs, only: [:index, :edit, :create, :update]
      resources :hair_catalogs, only: [:index, :new, :show, :edit, :create, :update]

    end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
