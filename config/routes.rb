Contactsup::Application.routes.draw do

  # Root
  root to: 'webpages#landing'

  # Sessions controller
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new', via: :get
  match '/signout', to: 'sessions#destroy', via: :delete

  # Users controller
  resources :users, only: [:new, :create, :show, :update, :destroy]
  match '/signup',  to: 'users#new', via: :get
  match '/forgot_password',  to: 'users#forgot_password', via: :post
  match '/reset_password',  to: 'users#reset_password_view', via: :get
  match '/reset_password',  to: 'users#reset_password', via: :put
  match '/update_password',  to: 'users#update_password', via: :put

  # Contacts controller
  resources :contacts, only: [:index, :create]
  match '/pending_contacts',  to: 'contacts#pending', via: :get
  match '/accept_signup', to: 'contacts#accept_signup_view', via: :get
  match '/accept_signup', to: 'contacts#accept_signup', via: :put
  match '/accept_signin', to: 'contacts#accept_signin_view', via: :get
  match '/accept_signin', to: 'contacts#accept_signin', via: :put
  match '/block_contact', to: 'contacts#block', via: :post
  match '/unblock_contact', to: 'contacts#unblock', via: :delete

end
