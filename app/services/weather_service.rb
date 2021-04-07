class WeatherService
	include HTTParty
	API_URL = 'http://api.openweathermap.org/data/2.5/weather'.freeze

	def initialize(historical_id)
		@historical_id = historical_id
	end

	def process_weather
		@response = HTTParty.get(API_URL, options)
		store_weather
	end

	private

	def options
		{ query: {
			lat: 51.5750611029945,
			lon: 11.730333915341257,
			appid: '6a5ad7d297c59e9f2a166e5b2a04249f'
		} }
	end

	def store_weather
		Models::WeatherData.new(@response, @historical_id).create_weather
	end
end
