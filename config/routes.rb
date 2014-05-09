OnlineShoppy::Application.routes.draw do
  get "dashboard/index"

  # get "products/index"

  # get "products/edit"

  # get "products/new"

  # get "brands/index"

  # get "brands/edit"

  # get "brands/new"

  # get "categories/index"

  # get "categories/edit"

  # get "categories/new"

  # get "home/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
  #match '/admin/users/new' => 'admin/user#new', :as => :new_admin_user

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)
   # match 'users/login' => 'users#login',:as =>:user_login
   # match 'users/authenticate_user' => 'users#authenticate_user', :as=>:authenticate_user
  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  namespace :admin do
    match 'users/login' => "users#login",:as=>:user_login,:via => :get
    match 'users/authenticate_user' => 'users#authenticate_user', :as=>:authenticate_user
    match "users/logout"=>"users#logout",:as=>:user_logout
 
    resources :users
    resources :sellers
    resources :customers
    resources :brands
    resources :products,:categories
  end
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'admin/dashboard#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
