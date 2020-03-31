Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"
    resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
      resources :doses, only: [:new, :create, :destroy]
      resources :ingredients, only: [:new, :create, :destroy]
    end
    resources :doses, only: [:destroy]
end
