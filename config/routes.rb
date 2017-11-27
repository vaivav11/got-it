Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  devise_for :users
  resources :products do
    resources :requests, only: [:new, :create, :update, :index]
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update] do
    resources :ureviews, only: [:new, :create]
  end
  resources :conversations do
  resources :messages
 end

  get '/acceptedrequests', to: 'users#accepted', as: 'user_ac-requests'
  get '/pendingrequests', to: 'users#pending', as: 'user_pe-requests'
  get '/declinedrequests', to: 'users#declined', as: 'user_de-requests'

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
