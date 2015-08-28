Rails.application.routes.draw do

  # get 'attempts/new'

  # get 'attempts/show'

  # get 'surveys/index'

  # get 'surveys/create'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'users/new'
  #get 'users/show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'
  #root 'surveys#index'

  get 'home'    => 'static_pages#home'
  get 'help'   => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  #get 'signup'  => 'users#new'
  get 'edit'  => 'users#edit'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  #member makes routes respong to URL containing user id
  #/users/1/following   and    /users/1/followers
  resources :users do
    member do
      get :following, :followers  #since both showing data
    end
  end  
  
  resources :users #methods such as delete are implicit
  resources :account_activations, only: [:edit]
  #resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  #resources 'surveys'
  #resources 'attempts'
  
  
  
  mount Rapidfire::Engine => "/rapidfire"
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
