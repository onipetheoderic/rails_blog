Rails.application.routes.draw do
  devise_for :users
  devise_for :installs
  resources :posts do #Now each comment has the crud ability, we now generate the controller for comment
  	resources :comments
  end

  get '/about', to: "pages#about"
  root "posts#index"
end
