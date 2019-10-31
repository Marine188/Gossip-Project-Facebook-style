Rails.application.routes.draw do
  root to: 'static_pages#welcome' #ou index

  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/later', to: 'static_pages#later'
  get '/welcome/', to: 'static_pages#welcome'#
  get '/welcome/:anything', to: 'static_pages#welcome'#

  resources :cities
  resources :gossips
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

end
