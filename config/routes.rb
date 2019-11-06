Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :slides do
      get :move_up
      get :move_down
      collection do
        post :update_positions
      end
    end

    resources :slide_locations
  end
end
