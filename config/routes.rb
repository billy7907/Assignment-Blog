Rails.application.routes.draw do
  get '/' => 'post#index'
  get '/show' => 'post#show'
end
