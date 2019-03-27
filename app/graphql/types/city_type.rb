# frozen_string_literal: true

# Graphql type for PeriodType Model
Types::CityType = GraphQL::ObjectType.define do
  name 'CityType'
  description 'Represents a City in the system.'

  field :id, !types.ID, 'The ID of the travel notify'
  field :name, types.String, 'The name of the city'
  field :url_name, types.String, 'The url name of the city'
end
