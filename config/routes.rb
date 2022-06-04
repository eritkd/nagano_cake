Rails.application.routes.draw do
 
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
    resources :genres
  end
  
  
  namespace :public do
    get 'homes/top'
  end
 
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
