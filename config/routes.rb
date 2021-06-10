Rails.application.routes.draw do
  root to:'home#index'
  devise_for :users, controllers: { confirmations: 'user/confirmations',
                                    omniauth_callbacks: 'user/omniauth_callbacks' }

  resource :home, controller: :home, only: [:index] do
    collection do
      get :content_sample
    end
  end

  resource :user, controller: :user, only: [:show]
  
end
