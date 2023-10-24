Rails.application.routes.draw do
  root "home#index"
  resources :articles do
    resources :comments
  end
  resources :home, only: [:index]
end
