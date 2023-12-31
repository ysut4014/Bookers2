Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books
  resources :users
  get "home/about", to: "homes#about", as: "homes_about"
  post '/books', to: 'books#create'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
