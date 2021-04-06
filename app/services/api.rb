require 'rubygems'
require 'mqtt'

class Api
    def initialize
    	@client = MQTT::Client.connect(:host => 'v2509608.en.emqx.cloud',
    								  :port => 12133,
    								  :username => 'agranimo-user',
    								  :password => 'challenge')
    end

    def subscribe
    	@client.subscribe('AGRANIMO/CHALLENGE')
    	get_messages
    end

    private

    def get_messages
    	@client.get do |topic, message|
    		puts "#{topic}: #{message}"
    	end
    end
end
