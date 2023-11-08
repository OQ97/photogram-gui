Rails.application.routes.draw do
  
  #Users 
  get("/", { :controller=> "users", :action=>"index"})
  get("/users", { :controller=> "users", :action=>"index"})
  post("/add_user", { :controller=> "users", :action=>"add"})
  get("/users/:username", { :controller=> "users", :action=>"show"})
  post("/update_user/:username", { :controller=> "users", :action=>"update"})

  get("/photos", { :controller=> "photos", :action=>"index"})
  post("/insert_photo_record", { :controller=> "photos", :action=>"add"})
  get("/photos/:photo_id", { :controller=> "photos", :action=>"show"})
  get("/delete_photo/:toast_id", { :controller=> "photos", :action=>"destroy"})
  post("/update_photo/:update_id", { :controller=> "photos", :action=>"update"})

  post("/add_comment/:photo_id", { :controller=> "photos", :action=>"comment"})

end
