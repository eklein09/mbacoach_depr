Rails.application.routes.draw do
  # Routes for the Application resource:
  # CREATE
  get '/applications/new', controller: 'applications', action: 'new', as: 'new_application'
  post '/applications', controller: 'applications', action: 'create', as: 'applications'

  # READ
  get '/applications', controller: 'applications', action: 'index'
  get '/applications/:id', controller: 'applications', action: 'show', as: 'application'

  # UPDATE
  get '/applications/:id/edit', controller: 'applications', action: 'edit', as: 'edit_application'
  patch '/applications/:id', controller: 'applications', action: 'update'

  # DELETE
  delete '/applications/:id', controller: 'applications', action: 'destroy'
  #------------------------------

  # Routes for the School resource:
  # CREATE
  get '/schools/new', controller: 'schools', action: 'new', as: 'new_school'
  post '/schools', controller: 'schools', action: 'create', as: 'schools'

  # READ
  get '/schools', controller: 'schools', action: 'index'
  get '/schools/:id', controller: 'schools', action: 'show', as: 'school'

  # UPDATE
  get '/schools/:id/edit', controller: 'schools', action: 'edit', as: 'edit_school'
  patch '/schools/:id', controller: 'schools', action: 'update'

  # DELETE
  delete '/schools/:id', controller: 'schools', action: 'destroy'
  #------------------------------

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#index'

  get '/users', controller: 'users', action: 'index'

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
