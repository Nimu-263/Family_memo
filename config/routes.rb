Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  root to: "homes#index"
  resources :homes, only: [:index, :new, :create, :destroy]
  get 'homes/:id', to: 'homes#checked'
end
