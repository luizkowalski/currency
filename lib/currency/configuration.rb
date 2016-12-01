module Configuration
  class BaseConfiguration
    attr_accessor :base, :options

    def initialize(base, options)
      @base = base
      @options = options
    end
  end
end
