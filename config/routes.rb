SignupSn::Application.routes.draw do
  root :to => 'application#home'
    
  resources :users
end
