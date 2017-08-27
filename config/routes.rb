Rails.application.routes.draw do
  
  root 'welcomes#index'
  devise_for :users
  
  get "welcomes/download_pdf"
  
  resources :welcomes do
    get :download, on: :member
  end
  
  resources :resumes do
    get :download, on: :member
  end
  
  get '*path' => redirect('/')
end
