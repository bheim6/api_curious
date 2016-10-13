Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get '/auth/github', as: 'github_login'
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/dashboard', to: 'dashboard#index'
  get '/dashboard/repos', to: 'dashboard#repos'
  get '/dashboard/starred', to: 'dashboard#starred'
end
