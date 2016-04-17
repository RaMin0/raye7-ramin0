Rails.application.routes.draw do
  # Web
  devise_for :users,
    path: '',
    path_names: { sign_in: 'login', sign_out: 'logout', password: 'forgot_password' },
    only: [:sessions, :passwords, :confirmations]
  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: :new_user_registration
    post 'register', to: 'devise/registrations#create'
    get 'profile/edit', to: 'devise/registrations#edit', as: :edit_user_registration
    patch 'profile', to: 'devise/registrations#update', as: :user_registration
    delete 'profile', to: 'devise/registrations#destroy'
  end
  
  root to: 'application#index'
end
