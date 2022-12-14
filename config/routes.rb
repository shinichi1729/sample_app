Rails.application.routes.draw do
  get 'sessions/new'
  get '/signup', to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"

  get "/users/new", to: "users#new"
  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
