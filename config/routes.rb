Rails.application.routes.draw do
  # Routes for the Application resource:
  # CREATE
  get "/applications/new", :controller => "applications", :action => "new"
  post "/create_application", :controller => "applications", :action => "create"

  # READ
  get "/applications", :controller => "applications", :action => "index"
  get "/applications/:id", :controller => "applications", :action => "show"

  # UPDATE
  get "/applications/:id/edit", :controller => "applications", :action => "edit"
  post "/update_application/:id", :controller => "applications", :action => "update"

  # DELETE
  get "/delete_application/:id", :controller => "applications", :action => "destroy"
  #------------------------------

  # Routes for the School resource:
  # CREATE
  get "/schools/new", :controller => "schools", :action => "new"
  post "/create_school", :controller => "schools", :action => "create"

  # READ
  get "/schools", :controller => "schools", :action => "index"
  get "/schools/:id", :controller => "schools", :action => "show"

  # UPDATE
  get "/schools/:id/edit", :controller => "schools", :action => "edit"
  post "/update_school/:id", :controller => "schools", :action => "update"

  # DELETE
  get "/delete_school/:id", :controller => "schools", :action => "destroy"
  #------------------------------

  # Routes for the users resource
  get "/users/", :controller => "users", action: "index"

  get "/users/:id/show", :controller => "users", action: "show"

  get "/users/new", controller: "users", action: "new"

  get "/users/:id/edit", controller: "users", action: "edit"

  post "/update_user/:id", controller: "users", action: "update"

  get "/users/:id/probabilities", :controller => "users", action: "estimateProbabilities"

  get "/users/:id/probabilities", :controller => "users", action: "estimateProbabilities"

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: "users/sessions" }

  get "/users/:id", :controller => "users", action: "show"

  get "/delete_user/:id", :controller => "users", action: "destroy"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
