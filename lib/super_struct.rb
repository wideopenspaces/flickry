require 'ostruct'
# Code shamelessly stolen from http://errtheblog.com/post/30
class SuperStruct < OpenStruct
  include Enumerable

  def members
    methods(false).grep(/=/).map { |m| m[0...-1] }
  end

  def each
    members.each do |method|
      yield send(method)
    end
    self
  end
  
  def each_pair
    members.each do |method|
      yield method, send(method)
    end
    self
  end
  
  def [](member)
    send(member)
  end

  def []=(member, value)
    send("#{member}=", value)
  end
end