module Http
  class BusTravels
    include HTTParty
    base_uri 'https://www.recorrido.cl/api/v2/es'

    def initialize(departure_city_id:, destination_city_id:, departure_date:, return_date: nil)
      @options = { bus_travel: { departure_city_id: departure_city_id,
                                 destination_city_id: destination_city_id,
                                 departure_date: departure_date.strftime('%d-%m-%Y'),
                                 return_date: return_date ? return_date.strftime('%d-%m-%Y') : nil} }
    end

    def create
      self.class.post('/bus_travels.json', body: @options)
    end
  end
end
