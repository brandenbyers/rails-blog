module AuthHelper
  def http_login
    
    username = 'dhh'
    password = 'secret'
    
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
  end
end