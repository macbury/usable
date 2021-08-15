class Service
  extend Usable

  def self.call(*args, **kwargs, &block)
    new(*args, **kwargs).call(&block)
  end

  def call
    raise NotImplementedError, 'Implement service call method!'
  end
end