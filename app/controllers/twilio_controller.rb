require 'twilio-ruby'

class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def voice
    account_sid = "AC5ce13b91d2d5dfbbda3bc73e5db22d5a" # Your Test Account SID from www.twilio.com/console/settings
    auth_token = "3ef3637e12cee75cedc04cd35a585de6"   # Your Test Auth Token from www.twilio.com/console/settings
    @client = Twilio::REST::Client.new account_sid, auth_token

    current_user.friends.each do |friend|
      @client.messages.create(
          body: "This is a message from 'GET HOME SAFE' #{current_user.first_name} #{current_user.last_name} activated the DISTRESS function by pressing the 'HELP' button! IN DOUBT CALL 112!",
          to: friend.user.phone_number,    # Replace with your phone number
          from: "+3197010258493")  # Use this Magic Number for creating SMS
    end
        # @message = message.sid
  end
end
