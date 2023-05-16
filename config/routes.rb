Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/my_watches', to: 'watches#my_watches'
  post '/watches/:watch_id',  to: 'rentals#create', :as => 'create_rental'


# rentals for renting watches. We are using type option in resources to specify the type of rental either letting or rental
  resources :watches
end
