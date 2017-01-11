require_relative 'http'

class Slack < Struct.new(:url)
  ICON_URLS = {
    lockitron: 'https://cl.ly/0t3m152d2Y0u/unnamed.png',
    lock:      'https://cl.ly/3P023R0J1U0w/7ffd5a209863c42c039c1c922eec3f91.png',
    unlock:    'https://cl.ly/2Z0g2z072m3e/a516f766bc0882b2febba2dfa35b4d67.png',
  }

  def notify_locked_status event, is_locked
    HTTP.https_post_json url,
      username: 'lockitron',
      icon_url: ICON_URLS.fetch(:lockitron),
      attachments: [{
        fallback: "#{event.user.first_name} #{event.user.last_name} #{'un' if !is_locked}locked #{event.lock.name}",
        color: is_locked ? 'good' : 'danger',
        thumb_url: ICON_URLS.fetch(is_locked ? :lock : :unlock),
        fields: [
          {
            title: 'Status',
            value: is_locked ? 'Locked' : 'Unlocked',
            short: true,
          },
          {
            title: 'Who',
            value: "#{event.user.first_name} #{event.user.last_name}",
            short: true,
          },
          {
            title: 'Lock',
            value: event.lock.name,
            short: true,
          },
          {
            title: 'When',
            value: event.time.strftime('%l:%M%P'),
            short: true,
          }
        ]
      }]
  end

  def notify_locked event
    notify_locked_status event, true
  end

  def notify_unlocked event
    notify_locked_status event, false
  end
end
