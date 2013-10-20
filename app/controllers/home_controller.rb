class HomeController < ApplicationController
  skip_filter :authenticate_user!
  def index
    redirect_to action: 'app' if user_signed_in?
  end
  
  def app
    redirect_to root_path if not user_signed_in?
  end
  
  def sign_in_as_guest
    guest = User.find_or_create_by_name(name: "Guest", password: "guest123", email:"email@guest.com")
    sign_in guest
    redirect_to action: 'app'
  end
end
