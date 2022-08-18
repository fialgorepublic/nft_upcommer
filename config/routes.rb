Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :nft_events, only: %i[create index show]
      resources :plans, only: %i[index show]
    end
  end
end
