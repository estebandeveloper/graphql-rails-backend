# frozen_string_literal: true

# Mutation to create new Travel Notify
module Mutations
  permitted_params = %i[user_id name departure_date return_date klass_type price
                        bus_travel_id departure_city_id destination_city_id return_date]

  TravelNotify::CreateTravelNotify = GraphQL::Relay::Mutation.define do
    name 'CreateTravelNotify'

    input_field :user_id, types.ID
    input_field :name, types.String
    input_field :departure_date, Types::DateType
    input_field :return_date, Types::DateType
    input_field :klass_type, types.Int
    input_field :price, types.Int
    input_field :bus_travel_id, types.ID
    input_field :departure_city_id, types.ID
    input_field :destination_city_id, types.ID

    return_type !Types::TravelNotifyType

    resolve lambda { |_, inputs, _|
      params_hash = inputs.to_h.with_indifferent_access
      travel_notify = ::TravelNotify.create(params_hash.slice(*permitted_params))
      travel_notify
    }
  end
end
