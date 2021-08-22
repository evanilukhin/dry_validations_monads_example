class ExperimentsController
  def create
    result = ConductExperiment.call(experiment_params)

    if result[:success]
      render json: result[:result]
    else
      render json: result[:errors], status: :bad_request
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
