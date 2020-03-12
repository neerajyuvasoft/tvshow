Rails.application.routes.draw do
  devise_for :users
  root 'tv_shows#index'
  post "tv_shows/add_remove_favourite"
  get "tv_shows/search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
