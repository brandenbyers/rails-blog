Blog::Application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", omniauth_callbacks: "omniauth_callbacks" }
  resources :posts do
    resources :comments
  end

  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  root 'welcome#index'
end
