Rails.application.routes.draw do
  resources :products

  get '/searches/(:query)', to: 'searches#index', as: 'search'
  root to: 'home#index'
end
