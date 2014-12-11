Yabe::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'home', to: 'users#home', as: 'home'
  
  resources :sessions
  resources :users
  resources :charges
  resources :photos

  root 'users#home'
  
end
