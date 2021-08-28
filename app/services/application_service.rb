class ApplicationService
  def initialize(*params, &block)
    @params = params
    @block = block
  end

  def call
    validation_result = validator.new.call(@params) unless validator.nil?
    if validation_result.success?
      execute
    else
      { success: false, errors: validation_result.errors.to_h }
    end
  end

  def validator
    nil
  end

  def self.call(*params, &block)
    new(*params, &block).call
  end
end
