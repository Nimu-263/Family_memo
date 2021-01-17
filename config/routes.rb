Rails.application.routes.draw do
  get 'homes/index'
  get 'boards/index'
  get 'messages/index'
  root to: "homes#index"
end
