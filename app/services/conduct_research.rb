class ConductResearch < ApplicationService
  def initialize(params)
    super
    @params = params
  end

  def validator
    ConductResearchContract
  end

  def execute
    result =
      @params[:experiments].map do |experiment_params|
        yield ConductExperiment.call(experiment_params)
      end
    Success(result)
  end
end
