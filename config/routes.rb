Rails.application.routes.draw do
  # get 'enrollments/git'
  # get 'enrollments/add'
  # get 'enrollments/.'
  root 'users#index'

  
  resources :users

  resources :courses do
    resources :enrollments, only: [:index, :new, :create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
