Rails.application.routes.draw do
  resources :mining_types
  root to: 'welcome#index'
  resources :coins

  # Para escrever totas manualmente:
    # HTTPverb 'path', to: "controller#action"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
