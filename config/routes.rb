Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations'
  }
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end

  resources :products
  resources :categories, only: [:show]
  
  resources :pages, only: [:show]
  

  
  get 'abouts', to: 'abouts#index'
  post 'products/add_to_cart/:id', to:'application#add_to_cart', as: 'add_to_cart'
  post 'adjust_quantity/:id' => 'application#adjust_quantity', as: 'adjust_quantity'
  delete 'products/remove_from_cart/:id', to:'application#remove_from_cart', as: 'remove_from_cart'
end
