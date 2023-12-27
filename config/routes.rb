Rails.application.routes.draw do
  get 'user/profile'
  devise_for :users, controllers:{
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }
  get 'u/:id', to: 'user#profile', as: 'user'

  # /posts/1/comments/4
  resources :posts do
        resources :comments
  end
  get 'pages/about', to: 'pages#about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#home"
  # root "posts#index"
end
