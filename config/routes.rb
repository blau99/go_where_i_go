Rails.application.routes.draw do
  root :to => "favorites#index"
  # Routes for the Friend_request resource:
  # CREATE
  get "/friend_requests/new", :controller => "friend_requests", :action => "new"
  post "/create_friend_request", :controller => "friend_requests", :action => "create"

  # READ
  get "/friend_requests", :controller => "friend_requests", :action => "index"
  get "/friend_requests/:id", :controller => "friend_requests", :action => "show"

  # UPDATE
  get "/friend_requests/:id/edit", :controller => "friend_requests", :action => "edit"
  post "/update_friend_request/:id", :controller => "friend_requests", :action => "update"

  # DELETE
  get "/delete_friend_request/:id", :controller => "friend_requests", :action => "destroy"
  #------------------------------

  # Routes for the Restaurant resource:
  # CREATE
  get "/restaurants/new", :controller => "restaurants", :action => "new"
  post "/create_restaurant", :controller => "restaurants", :action => "create"

  # READ
  get "/restaurants", :controller => "restaurants", :action => "index"
  get "/restaurants/:id", :controller => "restaurants", :action => "show"

  # UPDATE
  get "/restaurants/:id/edit", :controller => "restaurants", :action => "edit"
  post "/update_restaurant/:id", :controller => "restaurants", :action => "update"

  # DELETE
  get "/delete_restaurant/:id", :controller => "restaurants", :action => "destroy"
  #------------------------------

  # Routes for the Best_dish resource:
  # CREATE
  get "/best_dishes/new", :controller => "best_dishes", :action => "new"
  post "/create_best_dish", :controller => "best_dishes", :action => "create"

  # READ
  get "/best_dishes", :controller => "best_dishes", :action => "index"
  get "/best_dishes/:id", :controller => "best_dishes", :action => "show"

  # UPDATE
  get "/best_dishes/:id/edit", :controller => "best_dishes", :action => "edit"
  post "/update_best_dish/:id", :controller => "best_dishes", :action => "update"

  # DELETE
  get "/delete_best_dish/:id", :controller => "best_dishes", :action => "destroy"
  #------------------------------

  # Routes for the Photo resource:
  # CREATE
  get "/photos/new", :controller => "photos", :action => "new"
  post "/create_photo", :controller => "photos", :action => "create"

  # READ
  get "/photos", :controller => "photos", :action => "index"
  get "/photos/:id", :controller => "photos", :action => "show"

  # UPDATE
  get "/photos/:id/edit", :controller => "photos", :action => "edit"
  post "/update_photo/:id", :controller => "photos", :action => "update"

  # DELETE
  get "/delete_photo/:id", :controller => "photos", :action => "destroy"
  #------------------------------

  # Routes for the Accommodation resource:
  # CREATE
  get "/accommodations/new", :controller => "accommodations", :action => "new"
  post "/create_accommodation", :controller => "accommodations", :action => "create"

  # READ
  get "/accommodations", :controller => "accommodations", :action => "index"
  get "/accommodations/:id", :controller => "accommodations", :action => "show"

  # UPDATE
  get "/accommodations/:id/edit", :controller => "accommodations", :action => "edit"
  post "/update_accommodation/:id", :controller => "accommodations", :action => "update"

  # DELETE
  get "/delete_accommodation/:id", :controller => "accommodations", :action => "destroy"
  #------------------------------

  # Routes for the Points_of_interest resource:
  # CREATE
  get "/points_of_interests/new", :controller => "points_of_interests", :action => "new"
  post "/create_points_of_interest", :controller => "points_of_interests", :action => "create"

  # READ
  get "/points_of_interests", :controller => "points_of_interests", :action => "index"
  get "/points_of_interests/:id", :controller => "points_of_interests", :action => "show"

  # UPDATE
  get "/points_of_interests/:id/edit", :controller => "points_of_interests", :action => "edit"
  post "/update_points_of_interest/:id", :controller => "points_of_interests", :action => "update"

  # DELETE
  get "/delete_points_of_interest/:id", :controller => "points_of_interests", :action => "destroy"
  #------------------------------

  # Routes for the Favorite resource:
  # CREATE
  get "/favorites/new", :controller => "favorites", :action => "new"
  post "/create_favorite", :controller => "favorites", :action => "create"

  # READ
  get "/favorites", :controller => "favorites", :action => "index"
  get "/favorites/:id", :controller => "favorites", :action => "show"

  # UPDATE
  get "/favorites/:id/edit", :controller => "favorites", :action => "edit"
  post "/update_favorite/:id", :controller => "favorites", :action => "update"

  # DELETE
  get "/delete_favorite/:id", :controller => "favorites", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
