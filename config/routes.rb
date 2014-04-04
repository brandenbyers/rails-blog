Blog::Application.routes.draw do
  resources :posts

  root 'welcome#index'

  Blog::Application.routes.draw do
    resources :posts
    
    root 'welcome#index'
  end
end
