Rails.application.routes.draw do
  use_doorkeeper

  scope module: :api, defaults: { format: :json }, path: 'api' do
    scope module: :v1, path: 'v1' do
      devise_for :users, controllers: {
        registrations: 'api/v1/users/registrations'
      }, skip: %i[sessions password]

      get '/me', to: 'credentials#me'

      resources :posts do
        resources :comments, only: %i[index create]
      end
    end
  end
end
