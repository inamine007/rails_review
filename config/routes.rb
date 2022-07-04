Rails.application.routes.draw do
  root to: 'books#index'
  get 'books/index'
  get 'books/:id' => 'books#show'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
