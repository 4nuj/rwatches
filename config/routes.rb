Rails.application.routes.draw do
  devise_for :users
  resources :watches
  root to: "pages#home"
  get '/my_watches', to: 'watches#my_watches'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
