Rails.application.routes.draw do
  root to: 'todos#index'
  
  devise_for :users

  resources :todo_items, only: [:index, :create, :update, :destroy] do
    patch 'complete'
  end
  resources :todos
  resources :users do
    resources :todos, only: [:index]
  end

end
