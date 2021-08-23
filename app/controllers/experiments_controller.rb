class ExperimentsController
  def create
    result = ConductExperiment.call(experiment_params)
    if result.success?
      render json: result.value!
    else
      render(json: result.failure.errors(full: true).to_h, status: :bad_request)
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
