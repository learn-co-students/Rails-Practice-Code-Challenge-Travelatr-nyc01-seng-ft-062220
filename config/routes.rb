Rails.application.routes.draw do
  resources :bloggers, only: :show
  resources :destinations, only: :show 
  resources :posts, only: [:edit, :update, :show, :new, :create] do
    resources :likes, only: :create
  end
end
