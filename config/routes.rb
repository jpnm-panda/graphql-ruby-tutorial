Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'users', to: 'users#index'
  get 'users/*id', to: 'users#user'
  post 'users', to: 'users#add'
end
