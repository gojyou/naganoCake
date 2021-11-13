Rails.application.routes.draw do

devise_for :admins, :controllers => {
   :registrations => 'admin/registrations',
   :sessions => 'admin/sessions',
   :passwords => 'admin/passwords'
  }

root to: 'homes#top'
get'about' => 'homes#about'

   namespace :admin do

       #devise_for :customers, class_name: "Public::Customer"
       resources :genres
       resources :items
       resources :customers
       resources :customers

       get'/'=> 'homes#top'
      resources :orders

   end

  namespace :public do
      get'customers/edit' =>"customers#edit"
      patch'customers/update' => 'customers#update'
      devise_for :customers,only: [:sign_in, :sign_out, :session,:registration], class_name: "Customer"

      resources :genres
      resources :items

      get'about' => 'homes#about'
      resource :customers
      get'/customers/mypage/withdrawal'=>"customers#withdrawal"
      patch'/customers/mypage/withdrawalprcess'=>'customers#withdrawalprcess'
      resources :addresses


      delete '/cart_items/all_destroy'=>"cart_items#all_destroy"
      resources :cart_items

      post'/orders/verification'=>'orders#verification'
      get'/orders/complecation'=>'orders#completion'
      resources :orders
      resources :order_details
  end



end

