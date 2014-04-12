require 'dogapi'

class Reporters::Datadog
  def initialize(config)
    api_key = config['api_key'] or raise ArgumentError.new('datadog api_key is required')

    @api = Dogapi::Client.new(api_key)
  end

  def report(name, value)
    @api.emit_point(name, value)
  end

  def finalize
    # Nothing to do here
  end
end