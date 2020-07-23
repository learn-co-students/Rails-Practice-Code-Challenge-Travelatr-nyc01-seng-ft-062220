Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, except: :destroy
  resources :destinations, only: :show
  resources :posts, except: [:index, :destroy] do 
    put :likes
  end
end
