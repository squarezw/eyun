C72::Application.routes.draw do
  namespace :admin do
   resources :product_categories
   resources :products do
     get 'set_recommend', :on => :member
     get 'cancel_recommend', :on => :member
   end
   resources :brands
  end

  resources :products

end
