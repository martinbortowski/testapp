Rails.application.routes.draw do
  scope "(:locale)", locale: /en|de/ do
    root 'welcomes#index'
    devise_for :users
    get "language" => "welcomes#language"
    
    get "welcomes/download_pdf"
    
    resources :welcomes do
      get :download, on: :member
    end
    
    resources :resumes do
      get :download, on: :member
    end
    
    get '*path' => redirect('/')
  end
end
