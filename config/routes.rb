Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :projects, except: %i(new edit) do
        resources :tasks, except: %i(new edit destroy)
      end
    end
  end
end
