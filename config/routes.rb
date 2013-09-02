Ircfog::Application.routes.draw do
  resources :networks

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end