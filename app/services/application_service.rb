class ApplicationService
  def initialize(*params, &block)
    @params = params
    @block = block
  end

  def call
    validation_result = validate_params
    if validation_result[:success]
      execute
    else
      validation_result
    end
  end

  # if validate_params doesn't redefined in a child, skip it by defining the successful result
  def validate_params
    { success: true }
  end

  def self.call(*params, &block)
    new(*params, &block).call
  end
end
