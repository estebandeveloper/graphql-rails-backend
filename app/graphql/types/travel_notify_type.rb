# frozen_string_literal: true

Types::TravelNotifyType = GraphQL::ObjectType.define do
  name 'TravelNotifyType'
  description ''

  field :id, !types.ID, 'The ID of the travel notify'
  field :name, types.String, 'The name of the travel_notify'
  field :price, types.Int, 'price of the travel_notify'
  field :klass_type, types.Int, 'klass_type of the travel_notify' do
    resolve ->(obj, _, _) { TravelNotify.klass_types[obj.klass_type] }
  end
  field :status, types.Int, 'status of the travel_notify' do
    resolve ->(obj, _, _) { TravelNotify.statuses[obj.status] }
  end
  field :departure_city, Types::CityType, 'departure city' do
    resolve ->(obj, _, _) { obj.departure_city }
  end
  field :destination_city, Types::CityType, 'destination city' do
    resolve ->(obj, _, _) { obj.destination_city }
  end
  field :departure_date, Types::DateType, 'departure date of the travel notify' do
    resolve ->(obj, _, _) { obj.departure_date.strftime("%d-%m-%Y")}
  end
  field :return_date, Types::DateType, 'return date of the travel notify'
  field :travel_notify_history, types[Types::TravelNotifyHistoryType], 'travel notify history of travel_notify' do
    resolve ->(obj, _, _) { obj.travel_notify_history }
  end
  field :travel_notify_history_min, types[Types::TravelNotifyHistoryType], 'only min values of travel notify history per day' do
    resolve ->(obj, _, _) { obj.travel_notify_history_min }
  end
end
