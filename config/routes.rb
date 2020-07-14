Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :posts
  delete 'remove', to: 'images#remove'
  root 'posts#index'
end
