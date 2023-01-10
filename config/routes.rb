Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "hello#hello"

  get 'users', to: 'users#index'
  get 'users/*id', to: 'users#user'
  post 'users', to: 'users#add'
end
