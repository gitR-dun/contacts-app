Rails.application.routes.draw do
  get '/contacts' => 'contacts#index'
  get '/contacts/:id' => 'contacts#show'
  get '/all_johns' => 'contacts#johns'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
