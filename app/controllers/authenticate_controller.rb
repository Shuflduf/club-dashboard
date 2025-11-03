class AuthenticateController < ApplicationController
  def signup
  end

  def login
  end

  def slackcallback
    code = params[:code]
    slack_client_id = "2210535565.9831435111892"
    slack_client_secret = Rails.application.credentials.slack_client_secret
    redirect_uri = "https%3A%2F%2Flocalhost%3A3001%2Fauth%2Fslack%2Fcallback"
    puts code

    require "faraday"
    conn = Faraday.new(
      url: "https://slack.com",
      headers: { "Content-Type" => "application/x-www-form-urlencoded" }
    )

    request_uri = "/api/openid.connect.token?code=#{code}&client_id=#{slack_client_id}&client_secret=#{slack_client_secret}&redirect_uri=#{redirect_uri}"
    puts request_uri
    response = conn.post(request_uri) do |req|
    end

    puts response.body

    # redirect_to action: "login"
  end
end
