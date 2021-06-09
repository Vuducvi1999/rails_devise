Rails.application.routes.draw do
  root to:'home#index'
  devise_for :users
  get '/content_sample', to:'home#content_sample'
end
