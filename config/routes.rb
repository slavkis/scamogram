Rails.application.routes.draw do
  devise_scope :user do
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
  resources :users, only: [:show, :index]
  resources :posts do
    resources :post_comments
  end
  resources :messages, only: [:create, :destroy]
  resources :chats, only: [:index, :show, :create, :destroy]
end