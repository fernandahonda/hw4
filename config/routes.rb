Rails.application.routes.draw do

  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"

  get("/login", {:controller => "sessions", :action => "new"})
  get("/logout", {:controller => "sessions", :action => "destroy"})

  # Landing page (aka root route)
  get("/", { :controller => "places", :action => "index" })
  
end
