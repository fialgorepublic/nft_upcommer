Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      resources :nft_events, only: %i[create index show]
      resources :plans, only: %i[index show]
    end
  end
end
