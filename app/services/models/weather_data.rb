module Models
  class WeatherData

    def initialize(weather, historical_id)
      @weather = weather
      @historical = Historical.find(historical_id)
    end

    def create_weather
      main = @weather.dig('main')
      wind = @weather.dig('wind')
      sys = @weather.dig('sys')
      Weather.create(
        pressure: main.dig('pressure'),
        temperature: main.dig('temp'),
        humidity: main.dig('humidity'),
        sunset: sys.dig('sunset'),
        sunrise: sys.dig('sunrise'),
        wind_speed: wind.dig('speed'),
        wind_deg: wind.dig('deg'),
        event_id: @historical.id,
        tms: @historical.tms
      )
    end
  end
end
