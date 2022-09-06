require 'sidekiq/web'
require 'sidekiq/cron/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      resources :nft_events, only: %i[create index show] do
        collection do
          get :slider_nft
          post :search_nft
          get :get_bluechip_nft
        end
        put :update_plan, on: :member
      end
      resources :plans, only: %i[index show]
    end
  end
end
