require 'ostruct'

class LockEvent < Struct.new(:json)
  def time
    Time.at(json.fetch('timestamp'))
  end

  def activity; data('activity') end
  def user;     data('user')     end
  def lock;     data('lock')     end

  def data(key)
    OpenStruct.new(json.fetch('data').fetch(key))
  end
end
