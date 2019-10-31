Rails.application.routes.draw do
  root to: 'static_pages#welcome'
  
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/later', to: 'static_pages#later'

  resources :cities
  resources :gossips
  resources :users
end
