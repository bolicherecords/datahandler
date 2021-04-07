module Models
  class HistoricalData
    WEATHER_DEVICES = ['1_65500', '18_65500']

    def initialize(message)
      @message = JSON.parse(message).dig('data')
    end

    def process_message
      @historical = create_historical
      set_weather if WEATHER_DEVICES.include?(@historical.did)
    end

    private

    def create_historical
      Historical.create(
        did: @message.dig('DID'),
        fmw: @message.dig('FMW'),
        tms: @message.dig('TMS'),
        bvol: @message.dig('bvol'),
        tem1: @message.dig('tem1'),
        hum1: @message.dig('hum1'),
        solr: @message.dig('solr'),
        stm1: @message.dig('stm1'),
        smo1: @message.dig('smo1')
      )
    end

    def set_weather
      WeatherWorker.perform_async(@historical.id)
    end
  end
end
