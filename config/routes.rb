Rails.application.routes.draw do
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end

  # scope ":users/:id" do
  #   resources :posts, only: [:create, :destroy]
  # end
  devise_for :users, controllers: {
    confirmations: "users/confirmations",
    passwords: "users/passwords",
    registrations: "users/registrations",
    sessions: "users/sessions",
  }
  root "main_pages#index"
  resources :users, only: [:show]
  resources :posts do
    resources :post_comments
  end
end