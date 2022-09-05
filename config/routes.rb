Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :facilities, only: [:index, :show] do
    resources :reviews, only: [:create]
    resources :bookings, only: [:create]
  end

  resources :reviews, only: [:update, :destroy]

  resources :bookings, only: [:index, :edit, :destroy, :update]

end
