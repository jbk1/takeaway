require 'rubygems'
require 'twilio-ruby'

account_sid = 'AC368f27e1eb9dbfc3948222fc6a0e1e13'
auth_token = '49cb4d95ae254582b0977395eb2396bb'
@client = Twilio::REST::Client.new account_sid, auth_token

message = @client.account.messages.create(:body => "Hey Jimbo, well done one sending your first text via app",
	:to => "+447867987844",
	:from => "441324430101")
puts message.sid
