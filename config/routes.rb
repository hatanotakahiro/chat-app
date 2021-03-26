Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  get 'messages/index'
  resources :users, only: [:edit, :update]
  # ↓messageはuserが居てもいなくても存在できるが、roomがないと存在し得ないのでネストが必要
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
