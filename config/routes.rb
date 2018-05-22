Rails.application.routes.draw do
  root to: 'todos#index'
  
  # Auth
  devise_for :users

  # API
  namespace :api do
    namespace :v1 do
      resources :todo_items, only: [:index, :show, :create, :update, :destroy] do
        patch :complete
      end
      resources :todos, only: [:index, :show, :create, :update, :destroy]
      resources :users, only: [:index, :show]
    end
  end

  # Web
  resources :todo_items, only: [:index, :create, :update, :destroy] do
    patch :complete
  end
  resources :todos
  resources :users do
    resources :todos, only: [:index]
  end

end
