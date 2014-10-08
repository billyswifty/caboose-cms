module Caboose
  class LogoutController < ApplicationController
    # GET /logout
    def index
      Caboose.plugin_hook('before_logout')
      
      logout_user
      elo = User.find(User::LOGGED_OUT_USER_ID)        
      login_user(elo)      
      redirect_to "/"    
    end
  end
end