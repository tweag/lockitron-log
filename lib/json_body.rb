require 'json'

class JSONBody < Struct.new(:app)
  def call(env)
    rack_input = env['rack.input']
    env['json'] = JSON.parse(rack_input.read)
    rack_input.rewind
    app.call(env)
  end
end
