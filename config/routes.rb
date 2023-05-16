Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/my_watches', to: 'watches#my_watches'


# rentals for renting watches. We are using type option in resources to specify the type of rental either letting or rental
  resources :watches do
    resources :rentals, only: [:new, :create]
  end
  resources :rentals,  only: [:show, :destroy] do
    resources :reviews, only: [:new, :create]
    end
  end
