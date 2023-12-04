Rails.application.routes.draw do
  # Devise routes with custom controllers
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
 # config/routes.rb
resources :categories do
  resources :tasks
end

  # Your other routes
  root 'pages#home'
  get 'pages/home'
  get 'pages/users'

  # Health check route
  get 'up' => 'rails/health#show', as: :rails_health_check
end
