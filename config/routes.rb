Rails.application.routes.draw do
  resources :movies
  # Defines the root path route ("/")
  root :to => redirect('/movies')
end