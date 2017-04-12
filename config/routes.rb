Rails.application.routes.draw do
  # get '/' => 'posts#index'
  # get '/show' => 'posts#show'
  # get '/new' => 'posts#new'
  # post '/' => 'posts#create'
  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]


  patch '/users/:id/edit_password' => 'users#edit_password', as: :edit_password

  resources :users, except: [:destroy] do
    # patch :edit_password
    resources :likes, only: :index
    delete :destroy, on: :collection
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection

  end

  resources :posts, shallow: true do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end

  root 'posts#index'



end
