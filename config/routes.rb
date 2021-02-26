Rails.application.routes.draw do
  post '/login', to: 'sessions#create'
  get '/logged_in', to: 'sessions#logged_in'
  delete '/logout', to: 'sessions#logout'

  post '/signup', to: 'users#create'

  resources :holdings, only: [:create, :destroy]
  get '/holdings', to: 'holdings#all_holdings'
  get '/stock/:ticker', to: 'holdings#stock_holding'
end
