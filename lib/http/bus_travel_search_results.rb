module Http
  class BusTravelSearchResults
    include HTTParty
    base_uri 'https://www.recorrido.cl/api/v2/es'

    def initialize(bus_travel_id)
      @bus_travel_id = bus_travel_id
    end

    def results
      self.class.get("/bus_travels/#{@bus_travel_id}/search_results.json")
    end
  end
end
