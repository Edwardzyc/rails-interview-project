Rails.application.routes.draw do
  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  namespace :api do
    namespace :v1 do
      resources :questions, only: [:index, :show]
    end
  end
end
