Rails.application.routes.draw do
  resources :categories
  mount Ckeditor::Engine => '/ckeditor' if Gem.loaded_specs.has_key? "ckeditor"

  get 'about' => 'pages#about'

  get 'mentions' => 'pages#mentions'

  root 'pages#home'

  resources :articles do
  	resources :comments
  end
  resources :tags
  resources :authors

  resources :author_sessions, only: [ :new, :create, :destroy ]

  get 'login'  => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'

end
