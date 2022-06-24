Rails.application.routes.draw do
 
  namespace :public do
    resources :addresses
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    resources :items
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/complete'
    get 'orders/index'
    get 'orders/show'
  end
  
  namespace :public do
    resources :customers
    get 'customers/:id/unsubscribe' => 'customers#unsubscribe'
    patch 'customer/:id/withdraw' => 'customers#withdraw'
    put 'withdraw/:id' => 'customers#withdraw'
  end
  
  get 'order_details/show'
  get 'order_details/edit'
  
  namespace :admin do
    get 'homes/top'
  end
  
  namespace :admin do
    resources :items
    resources :genres
    resources :customers
  end
  
  

 
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


 get "/about" => "public/homes#about" ,as: 'about'
 root to:'public/homes#top'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
