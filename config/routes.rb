DistillWeb::Application.routes.draw do
  # GET /
  root :to => 'cfps#index'

  resources :cfps
  resources :proposals
  resources :speakers

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get '/user/sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get '/user/sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
end
