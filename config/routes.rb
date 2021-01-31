Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :homes, only: [:index, :create, :destroy]
  get 'homes/:id', to: 'homes#checked'
end
