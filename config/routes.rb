Rails.application.routes.draw do
  namespace :api do
    mount_devise_token_auth_for 'Student', at: 'auth/students', controllers: {
      registrations: 'api/auth/students'
    }
  end
end
