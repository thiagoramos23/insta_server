Rails.application.routes.draw do
  use_doorkeeper
  resources :posts do
    resources :comments, only: %i[index create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
