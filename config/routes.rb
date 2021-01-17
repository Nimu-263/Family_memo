Rails.application.routes.draw do
  root to: "homes#index"
  resources :boards, only: [:create, :destroy]
end
