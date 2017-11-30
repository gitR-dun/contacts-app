Rails.application.routes.draw do
  get '/first_contact' => 'contacts#the_contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
