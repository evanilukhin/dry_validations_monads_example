class ResearchesController < ApplicationController
  def create
    result = ConductResearch.call(research_params.to_h)

    if result[:success]
      render json: result[:result]
    else
      render json: result[:errors], status: :bad_request
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
