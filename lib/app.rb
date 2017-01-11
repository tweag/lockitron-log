require_relative 'slack'
require_relative 'lock_event'

class App
  def initialize
    @slack = Slack.new(ENV.fetch('SLACK_URL'))
  end

  def call(env)
    event = LockEvent.new(env.fetch('json'))

    case event.activity.kind
    when "lock-updated-locked"
      @slack.notify_locked event
    when "lock-updated-unlocked"
      @slack.notify_unlocked event
    end

    [200, { 'Content-Type' => 'text/plain'}, ['OK']]
  end
end
