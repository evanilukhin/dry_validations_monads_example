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
      { success: true, result: 'Success!' }
    else
      { success: false, errors: ['Definitely not success.'] }
    end
  end
end
