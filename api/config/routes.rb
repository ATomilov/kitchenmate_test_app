Rails.application.routes.draw do
  devise_for :users,
             defaults: { format: :json },
             path: '',
             path_names: {
               sign_in: 'api/login',
               sign_out: 'api/logout',
               registration: 'api/signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :products, only: %i[index] do
        member do
          post :add_to_favorite
        end
      end
      resources :users, only: [] do
        collection do
          get :show_favorite_products
        end
      end
    end
  end
end
