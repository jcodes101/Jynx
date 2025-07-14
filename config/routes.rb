Rails.application.routes.draw do
  resources :trees
  get "home/index"

  get "home/creator"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  devise_for :users, controllers: {
    # sessions: "users/sessions"
    registrations: "users/registrations"
  }

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root "home#index"

  devise_scope :user do
    # get '/users', to: 'devise/registrations#new'
    # get '/users/password', to: 'devise/passwords#new'
    #
    # Jcodes-Comment: the sign_out root is matched to the controller
    get "/users/sign_out" => "devise/sessions#destroy"
  end
end
