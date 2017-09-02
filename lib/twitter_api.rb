class TwitterApi

	def self.our_public_tweets
		client.user_timeline('martinbortowski', count: 6, exclude_replies: false, include_rts: true)
	end

	def self.client
		@client ||= Twitter::REST::Client.new do |config|
	      config.consumer_key        = "XXXXXXXXX"
	      config.consumer_secret     = "XXXXXXXXX"
		end
	end
	
end


