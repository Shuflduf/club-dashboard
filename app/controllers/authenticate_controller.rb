require "faraday"

class AuthenticateController < ApplicationController
  def signup
  end

  def login
  end

  def slackcallback
    request_params = {
      code: params[:code],
      client_id: "2210535565.9831435111892",
      client_secret: Rails.application.credentials.slack_client_secret,
      redirect_uri: "https%3A%2F%2Flocalhost%3A3001%2Fauth%2Fslack%2Fcallback"
    }

    conn = Faraday.new(
      url: "https://slack.com",
      headers: { "Content-Type" => "application/x-www-form-urlencoded" }
    )
    request_uri = "/api/openid.connect.token?#{request_params.to_query}"
    puts request_uri
    response = conn.post(request_uri)

    puts response.body

    # redirect_to action: "login"
  end
end
