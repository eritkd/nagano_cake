Rails.application.routes.draw do
 
  namespace :public do
    resources :addresses
    resources :cart_items
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :items
    get 'orders/confirm' => 'orders#confirm'
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete'
    resources :orders, only: [:new, :create, :index, :show, :destroy]
    resources :customers
    get 'customers/:id/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/:id/withdrawal' => 'customers#withdrawal'
  end
  
  get 'order_details/show'
  get 'order_details/edit'
  
  namespace :admin do
    get 'homes/top'
    resources :items
    resources :genres
    resources :customers
  end
  
  

 
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  registrations: "admin/registrations",
  sessions: "admin/sessions"
}


 get "/about" => "public/homes#about" ,as: 'about'
 root to:'public/homes#top'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
