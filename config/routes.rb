Hairapp::Application.routes.draw do
  resources :hairstyles

  get "home/index"
  root :to => "home#index"
end
