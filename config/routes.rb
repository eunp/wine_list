Rails.application.routes.draw do
  root 'welcome#index'

  resources :wines

  resources :stores do
    resources :locations
  end

end
