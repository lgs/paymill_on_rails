PaymillOnRails::Engine.routes.draw do

  root to: 'plans#index'
  resources :subscriptions
  resources :plans

end
