Rails.application.routes.draw do

  get "admin/index"

  get "admin/new"

  get "admin/create"

  get "admin/edit"

  get "admin/show"

  get "admin/update"

  get "admin/destroy"

  # The priority is based upon order of creation:
  # first created -> highest priority.

resources :employees

 get "employee/login" => 'employee#login'
  get "admin/forgot_password" => "admin#forgot_password"
  get "admin/password_filling_form" => "admin#password_filling_form"
post "admin/password_filling_form" => "admin#password_filling_form"


  get "employee/log" => 'employee#log'


  post   "employee/login" => 'employee#login'

  get "employee/welcome" => 'employee#welcome'

  get "employee/logout" => 'employee#logout'
  get "employee/change_password" => 'employee#change_password'

  get "employee/update_password" => 'employee#update_password'


  post "employee/update_password" => 'employee#update_password'

  get "employee/new" => 'employee#new'


  post "employee/create" => 'employee#create'

  patch "employee/create" => 'employee#create'

  get "employee/update" => 'employee#update'




  get "employee/index" => 'employee#index'

  get "employee/view_others_profile" => 'employee#view_others_profile'

  get "employee/show" => 'employee#show'




  get "employee/contact_us" => 'employee#contact_us'

#leave  details

    get "select/apply" => 'select#apply'

  get "select/create" => 'select#create'

  get "select/cancel" => 'select#cancel'

  get "select/view_approved" => 'select#view_approved'

  get "select/list" => 'select#list'

  get "select/leave_balance" => 'select#leave_balance'





  #Hr control

  get "admin/new_user" => 'admin#new_user'


  get "employee/display" => 'employee#display'

  get "employee/export_user_data" => 'employee#export_user_data'

  post   "employee/display"   =>  "employee#display"

 get "select/view_employee_leave" => 'select#view_employee_leave'

  get "select/hr_approve" => 'select#hr_approve'

  get "select/hr_approve_view" => 'select#hr_approve_view'

  get "employee/deactivate_users" => 'employee#deactivate_users'

  get "select/detect_unapplied_leaves" => 'select#detect_unapplied_leaves'

  get "employee/leave_list_export" => 'employee#leave_list_export'

  get "employee/date_list" => 'employee#date_list'

  get "employee/fill_mail" => 'employee#fill_mail'

  get "employee/add_leaves" => 'employee#add_leaves'

  get "employee/individual_leave_exports" => 'employee#individual_leave_export'

  get "employee/deactivation" => 'employee#deactivation'


  get "select/detect_leaves" => 'select#detect_leaves'

  #miscellaneous

  get "select/documents" => 'select#documents'

  get "select/download_form/year" => 'select#download_form#year'

  get "select/employee_new_leave_balance" => 'select#employee_new_leave_balance'



  #Rm control

  get "select/unapproved_leave" => 'select#unapproved_leave'

  get "select/list_all" => 'select#list_all'

  get "select/select_employee" => 'select#select_employee'

  get "select/employee_leave_balance" => 'select#employee_leave_balance'




#bootsrapp

  # get "/employee/modifyProfile.html"   =>  "employee#modifyProfile.html"
  #


patch "employee/new" => 'employee#index'

# post " /employee"   => "employee#index"

  post "employee/update" => 'employee#update'


  post "employee/update" => 'employee#index'


 post "employee/new" => 'employee#new'

   post "/select/apply"    =>  'select#apply'


 # post "select/create" => 'select#create'








  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

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

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'employee#log'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  #match ':controller(/:action(/:id(.:format)))'
  #match "/employee/:id" => "employee#log"













  # get "admin/index"
  #
  # get "admin/new"
  #
  # get "admin/create"
  #
  # get "admin/edit"
  #
  # get "admin/show"
  #
  # get "admin/update"
  #
  # get "admin/destroy"
  #
  #
  # get "admin/forgot_password"
  # root  'employee#log'
  # # match ':controller(/:action(/:id(.:format)))'
  #
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


