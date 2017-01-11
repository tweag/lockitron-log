require 'ostruct'

class LockEvent < Struct.new(:json)
  def time
    Time.at(json.fetch('timestamp'))
  end

  def activity; OpenStruct.new(json.fetch('data').fetch('activity')) end
  def user;     OpenStruct.new(json.fetch('data').fetch('user'))     end
  def lock;     OpenStruct.new(json.fetch('data').fetch('lock'))     end
end
