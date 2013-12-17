ContactPlus::Application.routes.draw do
  root 'home#index'

  devise_for :users
  
  resources :contacts 
  
  resources :groups 

  get "contacts/deleted", to: "contacts#index"
  get "contacts/all", to: "contacts#index"
  get "contacts/active", to: "contacts#index"

  get "contacts/send_message"
end
