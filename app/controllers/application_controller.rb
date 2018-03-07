class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  @default_user=User.find_by(username: 'stranger')
end
