DemoCloud::Application.routes.draw do 
 
 

  resources :consumers

get "password_resets/new"

match '/change_password', :controller => 'users', :action => 'change_password'

  resources :users 
 
  resources :sessions, :only => [:new,:create,:destroy,:edit]
  root :to => 'sessions#new'
  match 'dashboard' => 'users#dashboard', :as => 'user_root'
  match '/signup', :to =>'users#new'
  match '/signin', :to =>'sessions#new'
  match  '/users/:id/edit',  :to => "users#edit" 
  match '/signout', :to =>'sessions#destroy'
  match '/consumer_bill', :to =>'consumers#consumer_bill'
  match '/consumer_check', :to =>'consumers#consumer_check'
 resources :password_resets

end
