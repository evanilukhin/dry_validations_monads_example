class ConductResearch < ApplicationService
  def initialize(params)
    super
    @params = params
  end

  def validator
    ConductResearchContract
  end

  def execute
    result = []
    @params[:experiments].each do |experiment_params|
      experiment_result = ConductExperiment.call(experiment_params)

      return experiment_result unless experiment_result[:success]

      result << experiment_result[:result]
    end
    { success: true, result: result }
  end
end
