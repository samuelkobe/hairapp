Hairapp::Application.routes.draw do
  resources :hairstyles
  
  resources :hairstyles do
    post 'vote', :on => :collection
  end
  
  get "home/index"
  root :to => "home#index"
end
