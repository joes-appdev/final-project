Rails.application.routes.draw do
  devise_for :users
  
  
  # Routes for the Attendee resource:

  match("/", { :controller => "connections", :action => "list", :via => "get" })


  
  # Routes for the Location resource:

  # CREATE
  match("/new_location_form", { :controller => "locations", :action => "blank_form", :via => "get" })
  match("/insert_location_record", { :controller => "locations", :action => "save_new_info", :via => "post" })

  # READ
  match("/locations", { :controller => "locations", :action => "list", :via => "get" })
  match("/locations/:id_to_display", { :controller => "locations", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_location_form/:id_to_prefill", { :controller => "locations", :action => "prefilled_form", :via => "get" })
  match("/update_location_record/:id_to_modify", { :controller => "locations", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_location/:id_to_remove", { :controller => "locations", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Company resource:

  # CREATE
  match("/new_company_form", { :controller => "companies", :action => "blank_form", :via => "get" })
  match("/insert_company_record", { :controller => "companies", :action => "save_new_info", :via => "post" })

  # READ
  match("/companies", { :controller => "companies", :action => "list", :via => "get" })
  match("/companies/:id_to_display", { :controller => "companies", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_company_form/:id_to_prefill", { :controller => "companies", :action => "prefilled_form", :via => "get" })
  match("/update_company_record/:id_to_modify", { :controller => "companies", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_company/:id_to_remove", { :controller => "companies", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Connection resource:

  # CREATE
  match("/new_connection_form", { :controller => "connections", :action => "blank_form", :via => "get" })
  match("/insert_connection_record", { :controller => "connections", :action => "save_new_info", :via => "post" })

  # READ
  match("/connections", { :controller => "connections", :action => "list", :via => "get" })
  match("/connections/:id_to_display", { :controller => "connections", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_connection_form/:id_to_prefill", { :controller => "connections", :action => "prefilled_form", :via => "get" })
  match("/update_connection_record/:id_to_modify", { :controller => "connections", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_connection/:id_to_remove", { :controller => "connections", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Meeting resource:

  # CREATE
  match("/new_meeting_form", { :controller => "meetings", :action => "blank_form", :via => "get" })
  match("/insert_meeting_record", { :controller => "meetings", :action => "save_new_info", :via => "post" })

  # READ
  match("/meetings", { :controller => "meetings", :action => "list", :via => "get" })
  match("/meetings/:id_to_display", { :controller => "meetings", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_meeting_form/:id_to_prefill", { :controller => "meetings", :action => "prefilled_form", :via => "get" })
  match("/update_meeting_record/:id_to_modify", { :controller => "meetings", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_meeting/:id_to_remove", { :controller => "meetings", :action => "remove_row", :via => "get" })

  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
