class ConductExperiment < ApplicationService

  def initialize(params)
    super
    @params = params
  end

  def validate_params
    errors = []
    if @params[:duration].blank?
      errors << 'Duration should be present'
      return { success: false, errors: errors }
    end

    if @params[:duration] < 1
      errors << 'Duration should be positive number'
      return { success: false, errors: errors }
    end

    { success: true }
  end

  def execute
    if Random.rand > 0.3
      { success: true, result: 'Success!' }
    else
      { success: false, errors: ['Definitely not success.'] }
    end
  end
end
