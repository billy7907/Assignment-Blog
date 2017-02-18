Rails.application.routes.draw do
  # get '/' => 'posts#index'
  # get '/show' => 'posts#show'
  # get '/new' => 'posts#new'
  # post '/' => 'posts#create'
  root 'posts#index'

  resources :posts do
    resources :comments
  end



end
