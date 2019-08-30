Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #? typical routes
  #* resources - genterate all routes for the controller
  #* custom route - one you create - 
        # get 'where it is going' - get 'controller#action'
#* can only have one root route, this is your home page
  #  root 'controller#action' the main/root page , localhost:3000

root 'subs#index'

# one command writes all your routes
# resources :controller
resources :subs do
  resources :topics
end

resources :topics do
  resources :comments
end

end
