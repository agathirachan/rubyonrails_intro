Rails.application.routes.draw do
  #resources provide REST-ful routes to Rails resourses
  resources :articles
  # resources :articles, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'controller#actionMethod'
  # root 'application#hello'
  get 'about',to:"pages#about"
  get "signup", to:"users#new"
  resources :users, except: [:new]
  # post "users", to:"users#create"
  get "login",to:"sessions#new"
  post "login",to:"sessions#create"
  delete "logout", to:"sessions#destroy"
  resources :categories, except: [:destroy]
  root 'pages#home'
end
