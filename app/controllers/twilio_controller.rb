require 'twilio-ruby'

class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token



  def voice
    account_sid = ENV.fetch('TWILIO_ACCOUNT_SID')
    auth_token = ENV.fetch('AUTH_TOKEN')
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    current_user.friends.each do |friend|
      @client.messages.create(
        body: "This is a message from 'GET HOME SAFE' #{current_user.first_name.capitalize} #{current_user.last_name.capitalize} activated the DISTRESS function by pressing the 'HELP' button. IN DOUBT CALL 112",
        to: friend.user.phone_number,    # Replace with your phone number
        from: "+3197010204934")  # Use this Magic Number for creating SMS
    end
      # @message = message.sid
  end
end
