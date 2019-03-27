class TravelNotify < ApplicationRecord
  belongs_to :departure_city, class_name: :City
  belongs_to :destination_city, class_name: :City

  enum klass_type: %w[any premium luxury semi_luxury pullman]
  enum status: %w[in_progress completed error]

  validates :price, presence: true

  before_create :set_expiry
  after_create :initial_search

  def travel_notify_history
    TravelNotifyHistory.where(travel_notify_id: id)
  end

  def initial_search
    BusTravelGeneratorWorker.perform_async(id)
  end

  def set_expiry
    self.expiry = created_at + 7.days
  end

  def self.create_bus_travel(travel_notify_id:)
    travel_notify = find(travel_notify_id)
    bus_travel = Http::BusTravels
                 .new(departure_city_id: travel_notify.departure_city_id,
                      destination_city_id: travel_notify.destination_city_id,
                      departure_date: travel_notify.departure_date,
                      return_date: travel_notify.return_date)
    result = bus_travel.create
    return travel_notify.error! if result.code != 200

    result.parsed_response['id']
  end

  def travel_notify_history_min
    tn_history = travel_notify_history
    return [] if tn_history.blank?

    grouped_histories = travel_notify_history.group_by{|tnh| tnh.obtained_at.strftime("%d-%m-%y")}
    result = []
    grouped_histories.each do |gh|
      best_price = gh[1].min_by { |k| k['price'] }
      result << best_price
    end
    result
  end
end
