class AuthenticateController < ApplicationController
  def signup

  end

  def login
  end

  def slackcallback
    @code = params[:code]
    puts @code
    redirect_to action: "login"
  end
end
