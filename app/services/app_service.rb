class AppService
  extend Dry::Initializer

  class << self
    def call(*args, **kwargs, &block)
      new(*args, **kwargs).call(&block)
    end
  end
end
