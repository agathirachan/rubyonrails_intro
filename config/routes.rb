Rails.application.routes.draw do
  #resources provide REST-ful routes to Rails resourses
  resources :articles
  # resources :articles, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'controller#actionMethod'
  # root 'application#hello'
  root 'pages#home'
  get 'about',to:"pages#about"
end
