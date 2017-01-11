require_relative 'lib/require_api_key'
require_relative 'lib/json_body'
require_relative 'lib/app'
require_relative 'lib/env'

use RequireAPIKey, ENV.fetch('API_KEY')
use JSONBody

run App.new
