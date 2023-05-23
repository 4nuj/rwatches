Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/my_watches', to: 'watches#my_watches', as: :my_watches
  get 'user_rentals', to: 'rentals#index', as: :user_rentals

  resources :watches do
    resources :rentals, only: [:new, :create]
  end
  resources :rentals, only: [:show, :destroy] do
    resources :reviews, only: [:new, :create]
    end
  end
