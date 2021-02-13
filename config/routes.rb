Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  root to: "homes#index"
  resources :homes
  resources :memos, except: [:show]
  get 'memos/:id', to: 'memos#checked'
end
