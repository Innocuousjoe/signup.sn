SignupSn::Application.routes.draw do
  root :to => 'application#home'
    
  resources :users do
    get :interstitial, :on => :collection
  end
  
end
