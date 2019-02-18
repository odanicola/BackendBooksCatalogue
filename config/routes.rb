Rails.application.routes.draw do
  # post 'user_token' => 'user_token#create'

  devise_for :users, path: 'auth'
  devise_for :users, skip: :all
  devise_scope :user do
    get '/auth/sign_out', to: 'devise/sessions#destroy', as: :signout
    get '/login', to: 'devise/sessions#new', as: :signin
    post '/login', to: 'devise/sessions#create', as: :dosignin
  end

  # devise_for :users, path: 'auth', controllers: { sessions: 'users/sessions' }, path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  get 'welcome/index'

  resources :articles do
    resources :comments
  end
  resources :books
  resources :subjects
  # resources :api
  get '/api/books', to: 'api#books'
  get '/api/books/:id', to: 'api#show'
  get '/api/getuser/:email', to: 'api#getuser', constraints: { email: /[^\/]+/} , as: 'getuser'
  post '/api/signin' => 'api#signin'

  authenticated :user do
    root to: 'welcome#dashboard'
  end

  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
