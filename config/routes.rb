Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  # scope '/admin' do
  #   resources :stats, only: [:index]
  # end
  
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end

  #this does both scope and module as namespace:
  namespace :admin do
    resources :stats, only: [:index]
  end

  root 'posts#index'
end
