Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  
  resources :docs
  authenticated :user do
    #having 2 roots will confuse the application but you can create it and rename it as something else
    root "docs#index", as: "authenticated_root"
  end
  
  root 'welcome#index'
  

end
