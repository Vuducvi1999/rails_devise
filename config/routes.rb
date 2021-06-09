Rails.application.routes.draw do
  root to:'home#index'
  devise_for :users, controllers: { confirmations: 'confirmations' }

  resource :home, controller: :home, only: [:index] do
    collection do
      get :content_sample
    end
  end

  resource :user, controller: :user, only: [:show]
  
end
