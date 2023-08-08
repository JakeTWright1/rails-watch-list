Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'movies#home'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :movies, only: [:index, :show]
  resources :lists
end
