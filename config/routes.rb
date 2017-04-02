Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    post :bid, on: :member
    post :draw, on: :member
  end
  resources :users, only: [:show]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
