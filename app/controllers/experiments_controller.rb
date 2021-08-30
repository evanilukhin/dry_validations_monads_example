class ExperimentsController < ApplicationController
  def create
    result = ConductExperiment.call(experiment_params.to_h)
    if result.success?
      render json: result.value!
    else
      error_object =
        if result.failure.is_a?(Dry::Validation::Result)
          result.failure.errors(full: true).to_h
        else
          result.failure
        end

      render(json: error_object, status: :bad_request)
    end
  end

  private

  def experiment_params
    params.require(:experiment).permit(
      :name,
      :duration,
      :power_consumption
    )
  end
end
