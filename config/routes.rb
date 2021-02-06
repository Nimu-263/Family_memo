Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :update]
  root to: "homes#index"
  resources :homes, only: [:index, :new, :create, :destroy] do
    collection do
      post 'list_create'
    end
  end
  get 'homes/:id', to: 'homes#checked'
end
