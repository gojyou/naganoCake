Rails.application.routes.draw do
  namespace :public do
    get 'customers/show'
  end
  #devise_for :customers

  namespace :public do
  devise_for :customers, class_name: "Public::Customer"
root to: 'homes#top'
  #devise_for :users
  resources :genres
  resources :items
  get'top' => 'public_homes#top'
  get'about' => 'public_homes#about'
   resources :customers
   end

   namespace :admin do
       devise_for :users
       #devise_for :customers, class_name: "Public::Customer"
       resources :genres
       resources :items
       resources :customers

   end

end

