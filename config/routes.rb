Rails.application.routes.draw do
  # Authentication and Sessions
  resource :session
  resources :passwords, param: :token

  # Home Page
  get "page/index"
  root "centres#index"

  # Health Check
  get "up" => "rails/health#show", as: :rails_health_check

  # Centres and Nested Items
  resources :centres do
    resources :items, only: [:new, :create, :update, :destroy]  # ✅ Nested items under centres
  end

  # Search Functionality
  get "search_suggestions", to: "centres#suggestions"

  # Catch-all Routes (Optional: If you have standalone items)
  resources :items, only: [:index]  # ✅ Ensure standalone item index works if needed
end