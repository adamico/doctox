Rails.application.routes.draw do
  resources :products do
    resources :information
  end

  get '/searches/(:query)', to: 'searches#index', as: 'search'
  root to: 'home#index'
end
