Rails.application.routes.draw do
 
  namespace :public do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/complete'
    get 'orders/index'
    get 'orders/show'
  end
  get 'order_details/show'
  get 'order_details/edit'
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'customers/:id/show' => 'customers#show'
    get 'customers/:id/edit' => 'customers#edit'
    get 'customers/:id/unsubscribe' => 'customers#unsubscribe'
    patch 'customer/:id/withdraw' => 'customers#withdraw'
    put 'withdraw/:id' => 'customers#withdraw'
  end
  
  namespace :admin do
    resources :items
    resources :genres
    resources :customers
  end
  
  
  namespace :public do
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
