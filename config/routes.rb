Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  root 'pages#home'
  get '/pages/about' => 'pages#about'
  resources :articles
  resources :categories
  resources :article_categories, except: [:new, :update, :create, :destroy, :edit]
end