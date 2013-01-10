Contactsup::Application.routes.draw do

  # Root
  root to: 'webpages#landing'

  # Sessions controller
  resources :sessions, only: [:new, :create, :destroy]
  match '/login',  to: 'sessions#new', via: :get
  match '/logout', to: 'sessions#destroy', via: :delete

  # Users controller
  resources :users, only: [:new, :create, :edit, :update, :destroy]
  match '/signup',  to: 'users#new', via: :get
  match '/edit', to: 'users#edit', via: :get
  match '/forgot_password',  to: 'users#forgot_password', via: :post
  match '/reset_password',  to: 'users#reset_password_view', via: :get
  match '/reset_password',  to: 'users#reset_password', via: :put
  match '/update_password',  to: 'users#update_password', via: :put

  # Contacts controller
  resources :contacts, only: [:index, :create]
  match '/pendings',  to: 'contacts#pendings', via: :get
  match '/accept_signup', to: 'contacts#accept_signup_view', via: :get
  match '/accept_signup', to: 'contacts#accept_signup', via: :post
  match '/accept_login', to: 'contacts#accept_login_view', via: :get
  match '/accept_login', to: 'contacts#accept_login', via: :post
  match '/block_contact', to: 'contacts#block', via: :post
  match '/unblock_contact', to: 'contacts#unblock', via: :delete

end
