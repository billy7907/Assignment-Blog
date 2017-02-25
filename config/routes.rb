Rails.application.routes.draw do
  # get '/' => 'posts#index'
  # get '/show' => 'posts#show'
  # get '/new' => 'posts#new'
  # post '/' => 'posts#create'

  patch '/users/:id/edit_password' => 'users#edit_password', as: :edit_password

  resources :users, except: [:destroy] do
    # patch :edit_password
    delete :destroy, on: :collection
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection

  end

  resources :posts do
    resources :comments
  end

  root 'posts#index'



end
