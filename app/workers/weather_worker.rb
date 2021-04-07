class WeatherWorker
	include Sidekiq::Worker
	sidekiq_options retry: 3, backtrace: false

    def perform(historical_id)
      WeatherService.new(historical_id).process_weather
    end
end