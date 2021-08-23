class ConductExperiment < ApplicationService
  def initialize(params)
    super
    @params = params
  end

  def validator
    ConductExperimentContract
  end

  def execute
    if Random.rand > 0.3
      Success('Success!')
    else
      Failure('Definitely not success.')
    end
  end
end
