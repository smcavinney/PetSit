RailsStripeMembershipSaas::Application.routes.draw do
  resources :visit_blocks


  resources :default_prices


  resources :clients do
  	collection { post :import }
	end
  resources :client_prices

  mount StripeEvent::Engine => '/stripe'
  get "clients/gold"
  get "content/silver"
  get "content/platinum"
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  match "index.html" => "home#index"
  devise_for :users, :controllers => { :registrations => 'registrations' }
  resources :users
end