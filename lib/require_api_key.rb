class RequireAPIKey < Struct.new(:app, :api_key)
  def call(env)
    return denied unless api_key_matches?(env)

    app.call(env)
  end

  def api_key_matches?(env)
    Rack::Request.new(env).params['api-key'] == api_key
  end

  def denied
    [401, {}, ['BAD/NO API KEY']]
  end
end
