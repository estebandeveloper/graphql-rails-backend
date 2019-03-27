class TravelNotifyHistory
  include Mongoid::Document
  field :price, type: Integer
  field :klass_type, type: Integer, default: 0
  field :obtained_at, type: Date
  field :bus_operator_id, type: Integer
  field :bus_operator_name, type: String
  field :bus_travel_id, type: Integer
  field :travel_notify_id, type: Integer
  field :departure_time, type: DateTime
end
