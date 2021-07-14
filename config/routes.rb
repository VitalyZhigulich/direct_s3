Rails.application.routes.draw do
  resources :uploads#, only: %i[index new]

  root to: 'uploads#index'
end
