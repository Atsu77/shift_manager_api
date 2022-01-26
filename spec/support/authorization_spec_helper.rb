module AuthorizationSpecHelper
  def sign_in(user, sign_in_type)
    post "/api/auth/#{sign_in_type}/sign_in",
         params: { email: user[:email], password: user[:password] }, as: :json

    response.header.slice('client', 'access_token', 'uid')
  end
end
