Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :facilities, only: [:index, :show] do
    resources :reviews, only: [:create]
    resources :bookings, only: [:create]
  end

  resources :reviews, only: [:update, :destroy]

  resources :bookings, only: [:index]

  get "dashboard", to: "pages#dashboard", as: :dashboard
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
