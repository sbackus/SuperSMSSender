require 'sinatra'
require 'twilio-ruby' 

get '/' do
	erb :message_form
end

post '/send_message' do
	account_sid = ENV['TWILIO_ACCOUNT_SID']  
	auth_token = ENV['TWILIO_AUTH_TOKEN'] 
	 
	@client = Twilio::REST::Client.new account_sid, auth_token 
	 
	@client.account.messages.create({
		:from => '+18454434561', 
		:to => params[:phone_number],
		:body => params[:message]  
	})
	return "sending '#{params[:message]}' to #{params[:phone_number]}."
end