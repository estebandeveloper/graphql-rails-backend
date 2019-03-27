class BusTravelPriceWorker
  include Sidekiq::Worker

  def perform(travel_notify_id, bus_travel_id)
    bus_travel = Http::BusTravelSearchResults.new(bus_travel_id)
    result = bus_travel.results
    data = result.parsed_response['outbound'] ? result.parsed_response['outbound']['search_results'] : []
    unless data.blank?
      tn_klass = TravelNotify.klass_types[TravelNotify.find(travel_notify_id)&.klass_type]
      data = data.select { |bt| bt['seat_klass_stars'] == tn_klass } unless tn_klass.zero?
      best_price = data.min_by { |k| k['price'] }
      TravelNotifyHistory
        .find_or_create_by(price: best_price['price'].to_i,
                           klass_type: best_price['seat_klass_stars'].to_i,
                           travel_notify_id: travel_notify_id,
                           departure_time: best_price['departure_time'],
                           bus_operator_name: best_price['bus_operator_name'],
                           bus_operator_id: best_price['bus_operator_id'],
                           obtained_at: Date.today)
    end
    BusTravelGeneratorWorker.perform_in(15.seconds, travel_notify_id)
  end
end
