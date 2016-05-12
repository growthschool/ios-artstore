class Auth < Motion::Authentication
  strategy DeviseTokenAuth
  sign_in_url "http://api-artstore.dev/users/sign_in"
  sign_up_url "http://api-artstore.dev/users/sign_up"
end