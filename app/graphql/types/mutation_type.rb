Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"
  for mutation in Mutations::RootMutations.root_mutations
    field mutation.name, field: mutation.field
  end
end
