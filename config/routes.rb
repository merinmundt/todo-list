Rails.application.routes.draw do
  resources :employees
  resources :tasks, only: [:new, :create, :show]  
  resources :priorities

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/tasks', to: 'home#tasks', as: :home_tasks
    resources :employees # if you need full RESTful routes
    resources :tasks  # if you need full RESTful routes

end
