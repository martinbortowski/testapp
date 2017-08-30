class TwitterApi

	def self.our_public_tweets
		client.user_timeline('martinbortowski', count: 6, exclude_replies: false, include_rts: true)
	end

	def self.client
		@client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = "Dn413eSGEzulheiXNWxfZ44Eb"
      config.consumer_secret     = "kbuddDiMADE7Do1qklrWJ7xOB6Eo895qHafbx5ag5M8x3OP2X5"
		end
	end
	
end


