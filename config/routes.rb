Contactsup::Application.routes.draw do

  # Root
  root to: 'webpages#landing'

  # Sessions controller
  resources :sessions, only: [:new, :create, :destroy]
  match '/login',  to: 'sessions#new', via: :get
  match '/logout', to: 'sessions#destroy', via: :delete

  # Users controller
  resources :users, only: [:new, :create, :edit, :update]
  match '/signup',  to: 'users#new', via: :get
  match '/edit', to: 'users#edit', via: :get
  match '/forgot_password',  to: 'users#forgot_password', via: :post
  match '/reset_password',  to: 'users#reset_password_view', via: :get
  match '/reset_password',  to: 'users#reset_password', via: :put
  match '/update_password',  to: 'users#update_password', via: :put

  # Contacts controller
  resources :contacts, only: [:index, :create]
  match '/accept',  to: 'contacts#accept', via: :put
  match '/accept_signup', to: 'contacts#accept_signup_view', via: :get
  match '/accept_signup', to: 'contacts#accept_signup', via: :post
  match '/accept_login', to: 'contacts#accept_login_view', via: :get
  match '/accept_login', to: 'contacts#accept_login', via: :post
  match '/ignore',  to: 'contacts#ignore', via: :put
  match '/remind',  to: 'contacts#remind', via: :put
  #match '/block', to: 'contacts#block', via: :post
  #match '/unblock', to: 'contacts#unblock', via: :delete

end 
