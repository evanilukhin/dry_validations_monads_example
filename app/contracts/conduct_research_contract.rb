# frozen_string_literal: true

class ConductResearchContract < Dry::Validation::Contract
  Dry::Validation.load_extensions(:monads)

  params do
    required(:title).value(:string)
    required(:experiments).array(ConductExperimentContract.schema)
  end

  rule(:experiments).each do
    result = ConductExperimentContract.new.call(value)
    unless result.success?
      meta_hash = { text: 'contain bad example' }.merge(result.errors.to_h)
      key.failure(meta_hash)
    end
  end
end
