Rails.application.routes.draw do

  get 'users/new'

  match '/', to: 'static_pages#home', via: [:get]
  match '/help', to: 'static_pages#help', via: [:get]
  match '/home', to: 'static_pages#home', via: [:get]
  match '/about', to: 'static_pages#about', via: [:get]

  match '/signup', to: 'users#new', via: [:get]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
