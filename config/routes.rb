Yabe::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'option', to: 'users#option', as: 'option'

  resources :sessions
  resources :users
  resources :charges
  resources :photos
  resources :auctions

  root 'users#index'
  
end
