# frozen_string_literal: true

# Graphql type for PeriodType Model
Types::TravelNotifyHistoryType = GraphQL::ObjectType.define do
  name 'TravelNotifyHistoryType'
  description 'bla'

  field :id, !types.ID, 'The ID of the travel notify'
  field :klass_type, types.Int, 'klass_type of the travel_notify'
  field :price, types.Int, 'price of the travel_notify'
  field :obtained_at, Types::DateType, ''
  field :bus_operator_id, types.Int, 'bus id'
  field :bus_operator_name, types.String, 'name of bus operator'
  field :departure_time, Types::DateType, ''
end
