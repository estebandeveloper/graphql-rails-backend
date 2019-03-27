module Http
  class BusTravelSearchProgress
    include HTTParty
    base_uri 'https://www.recorrido.cl/api/v2/es'

    def initialize(bus_travel_id)
      @bus_travel_id = bus_travel_id
    end

    def search
      self.class.get("/search_progresses/#{@bus_travel_id}.json")
    end
  end
end
