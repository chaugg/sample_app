Rails.application.routes.draw do

  scope "(:locale)", locale: /vn|en/ do
    root "static_pages#home"
    get "/help", to: "static_pages#help"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/signup", to: "users#new"
    post "/login", to: "sessions#create"
    get "/login", to: "sessions#new"
    delete "/logout", to: "sessions#destroy"
  end

  resources :account_activations, only: :edit
  resources :password_resets, except: [:index, :show, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :users do
    resources :followings, only: [:index]
    resources :followers, only: [:index]
    end
end
