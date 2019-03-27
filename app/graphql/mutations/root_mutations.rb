# frozen_string_literal: true

module Mutations
  # Root mutations for main app
  class RootMutations
    def self.root_mutations
      [
        Mutations::TravelNotify::CreateTravelNotify
      ]
    end
  end
end
