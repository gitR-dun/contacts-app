Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  get '/contacts' => 'contacts#index'
  get '/contacts/:id' => 'contacts#show'
  post '/contacts' => 'contacts#create'
  patch '/contacts/:id' => 'contacts#update'
  get '/all_johns' => 'contacts#johns'

  post '/users' => 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
