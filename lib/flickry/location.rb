module Flickry
  class Location < Flickry::Base
    def initialize(locus)
      super(nil)
      extract_attrs!(locus, [:accuracy, :country, :county, :latitude, :locality, :longitude, :neighbourhood, :place_id, :region, :woeid])
    end
  end
end