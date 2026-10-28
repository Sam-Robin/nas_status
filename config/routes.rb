require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :gpu_metrics, only: [:index]
    end
  end
end
