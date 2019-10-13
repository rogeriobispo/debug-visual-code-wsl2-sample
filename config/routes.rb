Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :v1 do
    resources :dog_walking, only: [:index, :show, :create]
  
    patch '/dog_walking/:id/start_walking', to: 'dog_walking#start_walking'
    patch '/dog_walking/:id/stop_walking', to: 'dog_walking#stop_walking'
  end
end
