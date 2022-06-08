Rails.application.routes.draw do
 
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
