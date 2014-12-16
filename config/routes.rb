Yabe::Application.routes.draw do
  

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'option', to: 'users#option', as: 'option'
  get 'charges', to: 'charges#new', as: 'charges'
  get 'dashboard', to: 'users#dashboard', as: 'dashboard'
  post 'photo' => "photos#create", as: :photo_create
  get 'home', to: 'users#home', as: 'home'
  resources :categories
  resources :products

  resources :sessions
  resources :users
  resources :charges
  resources :photos
  resources :auctions


  root 'users#home'
  
end
