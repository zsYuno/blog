Rails.application.routes.draw do
  resources :articles, only: [:index, :new, :create, :edit, :update, :destroy]
  #post 'login', to: 'sessions#create'
  #delete 'logout', to: 'sessions#destroy'

  #get '*path', to: 'home#index', constraints: ->(req) { !req.xhr? && req.format.html? }
end