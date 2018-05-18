Rails.application.routes.draw do
  root to: 'todos#index'
  
  devise_for :users

  resources :todo_items
  resources :todos
  resources :users

end
