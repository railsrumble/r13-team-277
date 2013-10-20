class HomeController < ApplicationController
  skip_filter :authenticate_user!
  def index
    redirect_to action: 'app' if user_signed_in?
  end
  
  def app
  end
end
