Rails.application.routes.draw do
  get "/" => 'homes#top'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
