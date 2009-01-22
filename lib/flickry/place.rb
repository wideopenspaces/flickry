module Flickry
  class Place < String
    attr_reader :place_id, :woeid, :scale, :name
    def initialize(loc, scale)
      super(loc.to_s)
      @place_id = loc.place_id
      @woeid    = loc.woeid
      @scale    = scale
      @name     = self.to_s
    end
  end
end