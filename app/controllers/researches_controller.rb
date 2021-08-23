class ResearchesController
  def create
    result = ConductResearch.call(research_params)
    if result.success?
      render json: result.value!
    else
      render(json: result.failure.errors(full: true).to_h, status: :bad_request)
    end
  end

  private

  def research_params
    params.require(:research).permit(
      :title,
      experiments: %i[name duration power_consumption]
    )
  end
end
