Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  root to: 'books#index'
  get 'books/index'
  get 'books/:id' => 'books#show'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  get 'users' => 'users#new'
  post 'users' => 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
