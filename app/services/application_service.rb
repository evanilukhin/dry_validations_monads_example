class ApplicationService
  include Dry::Monads[:result, :do]

  def initialize(*params, &block)
    @params = params
    @block = block
  end

  def call
    yield validator.new.call(@params) unless validator.nil?
    execute
  end

  def validator
    nil
  end

  def self.call(*params, &block)
    new(*params, &block).call
  end
end
