Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/index", to: "clients#index" 
  resources :clients 
  get "/login" => "clients#login"
  post "/login1" => "clients#login1"
end
