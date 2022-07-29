Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get 'pages/home', to: 'pages#home'

  resources :recipes
  get '/signup', to: 'chefs#new'
  resources :chefs, except: [:new]
  # Defines the root path route ("/")
  # root "articles#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :ingredients, except: [:destroy]
  resources :comments, only: [:create]
end
