Rails.application.routes.draw do
  resources :todo_items
  resources :todos
  root to: 'todos#index'

  devise_for :users
end
