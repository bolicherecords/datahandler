module Models
  class HistoricalData
    def initialize(message)
      @message = JSON.parse(message)
    end

    def create_message
      data = @message.dig('data')
      Historical.create(
        did: data.dig('DID'),
        fmw: data.dig('FMW'),
        tms: data.dig('TMS'),
        bvol: data.dig('bvol'),
        tem1: data.dig('tem1'),
        hum1: data.dig('hum1'),
        solr: data.dig('solr'),
        stm1: data.dig('stm1'),
        smo1: data.dig('smo1')
      )
    end
  end
end
