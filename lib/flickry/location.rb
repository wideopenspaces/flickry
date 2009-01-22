require 'flickry/place'

module Flickry
  class Location < Flickry::Base
    def initialize(locus)
      super(nil)
      extract_attrs!(locus, [:accuracy, :latitude, :longitude, :place_id, :woeid])
      
      [:country, :county, :locality, :neighbourhood, :region].each do |scale|
        if locus.respond_to?(scale) and loc = locus.send(scale)
          self[scale] = Flickry::Place.new(loc, scale)
        else
          self[scale] = nil
        end
      end
    end
  end
end