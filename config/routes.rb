Rails.application.routes.draw do
  mount_devise_token_auth_for 'Student', at: 'auth'
end
