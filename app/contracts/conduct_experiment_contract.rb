# frozen_string_literal: true

class ConductExperimentContract < Dry::Validation::Contract
  Dry::Validation.load_extensions(:monads)

  params do
    required(:duration).value(:integer) # in seconds
    optional(:title).value(:string)
    optional(:power_consumption).value(:integer) # in MW
  end

  rule(:duration) do
    key.failure('Duration should be positive') unless value.positive?
  end

  rule(:power_consumption) do
    key.failure('Power consumption should be positive') if value && value < 1
  end
end