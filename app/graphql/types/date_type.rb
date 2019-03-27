Types::DateType = GraphQL::ScalarType.define do
  name 'Date'

  coerce_input ->(value, _ctx) { Date.parse(value.to_s) }
  coerce_result ->(value, _ctx) { value.to_s }
end
