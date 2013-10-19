class HomeController < ApplicationController
  skip_filter :authenticate_user!
  def index
  end
  def app
  end
end
