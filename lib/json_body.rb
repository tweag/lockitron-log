require 'json'

class JSONBody < Struct.new(:app)
  def call(env)
    env['json'] = JSON.parse(env['rack.input'].read)
    app.call(env)
  end
end
