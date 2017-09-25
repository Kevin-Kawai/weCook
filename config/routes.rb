Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#index"
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'signup', to: 'users#new', as: 'signup'
  resources :users, only: [:new,:create]
  resources :sessions, only: :create
  resources :recipes, only: [:new,:show,:create,:index] do
    resources :steps, only: [:new,:create]
    resources :ingredients, only: [:new,:create]
  end

end
