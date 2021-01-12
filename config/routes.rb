Rails.application.routes.draw do
  get 'boards/index'
  get 'messages/index'
  root to: "boards#index"
end
