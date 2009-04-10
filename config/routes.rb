ActionController::Routing::Routes.draw do |map|
  map.resource :session
  map.resources :venues, :has_many => :talks

  map.admin '/admin', :controller => 'application', :action => 'login'
  map.login '/login', :controller => 'application', :action => 'login'
  map.logout '/logout', :controller => 'application', :action => 'logout'

  map.root :controller => 'venues'
end
