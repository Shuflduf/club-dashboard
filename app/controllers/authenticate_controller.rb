class AuthenticateController < ApplicationController
  def signup

  end

  def login
  end

  def slackcallback
    @code = params[:code]
    puts @code

    require 'faraday'
    conn = Faraday.new(
      url: 'https://slack.com/',
      headers: {'Content-Type' => 'application/json'}
    )

    response = conn.post('/api/openid.connect.token') do |req|
      req.body = {'code' => @code, 'client_secret' => 'value2', 'client_id' => 'value3', 'redirect_uri' => 'value4'}.to_json
    end

    puts response.body
    # uri = URI.parse("https://slack.com/api/openid.connect.token")
    # request.set_form_data({'code' => 'value1', 'client_secret' => 'value2', 'client_id' => 'value3', 'redirect_uri' => 'value4'})

    redirect_to action: "login"

    
  end
end
