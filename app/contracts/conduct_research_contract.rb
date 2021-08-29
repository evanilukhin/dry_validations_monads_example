# frozen_string_literal: true

class ConductResearchContract < Dry::Validation::Contract
  MAX_POWER_CONSUMPTION = 30

  schema do
    required(:title).value(:string)
    required(:experiments).array(ConductExperimentContract.schema).value(min_size?: 1)
  end

  rule(:experiments).each do
    result = ConductExperimentContract.new.call(value)
    unless result.success?
      meta_hash = { text: 'contain bad example' }.merge(result.errors.to_h)
      key.failure(meta_hash)
    end
  end

  rule do
    total_power_consumption = values[:experiments].reduce(0) do |sum, experiment|
      experiment[:power_consumption].nil? ? sum : sum + experiment[:power_consumption]
    end

    if total_power_consumption > MAX_POWER_CONSUMPTION
      key(:experiments).failure("total energy consumption #{total_power_consumption} MW exceeded limit #{MAX_POWER_CONSUMPTION} MW")
    end
  end
end
