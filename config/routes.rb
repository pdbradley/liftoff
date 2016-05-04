Rails.application.routes.draw do
  resources :groups, except: [:show] do
    resources :members, except: [:show]
  end
end
