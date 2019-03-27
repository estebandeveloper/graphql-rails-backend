Types::Query::CitiesResolver = GraphQL::ObjectType.define do
  field :fetchCities, types[Types::CityType] do
    resolve ->(_, _, _) {
      City.all
    }
  end
end
