Rails.application.routes.draw do
  get '/contacts' => 'contacts#index'
  get '/contacts/:id' => 'contacts#show'
  post '/contacts' => 'contacts#create'
  patch '/contacts/:id' => 'contacts#update'
  get '/all_johns' => 'contacts#johns'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
