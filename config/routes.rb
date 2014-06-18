Blog::Application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }
  resources :posts do
    resources :comments
  end
    
  root 'welcome#index'
end
