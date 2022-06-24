class WelcomeController < ApplicationController
  def index
    # session funciona da mesma forma -> session[:nameOfSession] = "value" 
    cookies[:course] = "Ruby on Rails"
    @name = params[:name]
  end
end
