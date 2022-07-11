Rails.application.routes.draw do
  get 'favorites/index'
  post 'favorites' => 'favorites#create'
  delete 'favorites/:id' => 'favorites#destroy'
  resources :reviews
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  root to: 'books#index'
  get 'books/index'
  get 'books/:id' => 'books#show'
  get 'users/:id' => 'users#show'
  get 'users/new'
  get 'users/:id/edit' => 'users#edit'
  put 'users/:id' => 'users#update'
  get 'users' => 'users#new'
  post 'users' => 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
