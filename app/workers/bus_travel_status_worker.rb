class BusTravelStatusWorker
  include Sidekiq::Worker

  def perform(travel_notify_id, bus_travel_id)
    bus_travel = Http::BusTravelSearchProgress.new(bus_travel_id)
    result = bus_travel.search
    if result.code == 200
      status = result.parsed_response['progress_status']
      if status == 'complete'
        BusTravelPriceWorker.perform_async(travel_notify_id, bus_travel_id)
      else
        BusTravelStatusWorker.perform_in(10.seconds, travel_notify_id, bus_travel_id)
      end
    else
      travel_notify = TravelNotify.find(travel_notify_id)
      travel_notify.error!
    end
  end
end
