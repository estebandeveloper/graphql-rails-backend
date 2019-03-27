class BusTravelGeneratorWorker
  include Sidekiq::Worker

  def perform(travel_notify_id)
    travel_notify = TravelNotify.find(travel_notify_id)
    return if travel_notify.error? || travel_notify.completed?

    travel_notify.completed! if Time.now >= travel_notify.expiry
    bus_travel_id = TravelNotify.create_bus_travel(travel_notify_id: travel_notify_id)
    BusTravelStatusWorker.perform_in(10.seconds, travel_notify_id, bus_travel_id)
  end
end
