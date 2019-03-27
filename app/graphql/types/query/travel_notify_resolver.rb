Types::Query::TravelNotifyResolver = GraphQL::ObjectType.define do
  field :travelNotify, types[Types::TravelNotifyType] do
    resolve ->(_, args, _) {
      TravelNotify.all
    }
  end

  field :travelNotifyById, Types::TravelNotifyType do
    argument :id, types.ID, 'The id of the travel notify'

    resolve ->(_, args, _) {
      TravelNotify.find(args[:id])
    }
  end
end
