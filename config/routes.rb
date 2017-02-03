Rails.application.routes.draw do
  get 'searches/index'

  root to: 'home#index'

  get '/search', to: 'searches#index', as: 'search'
end
