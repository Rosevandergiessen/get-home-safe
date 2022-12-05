require 'twilio-ruby'

class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def voice
    account_sid = "AC5ce13b91d2d5dfbbda3bc73e5db22d5a" # Your Test Account SID from www.twilio.com/console/settings
    auth_token = "d7da442605a11aaa576f5fa73df8bd9d"   # Your Test Auth Token from www.twilio.com/console/settings

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Hello from Ruby",
        to: "+31614061990",    # Replace with your phone number
        from: "+3197010258493")  # Use this Magic Number for creating SMS

    @message =  message.sid
  end
end
