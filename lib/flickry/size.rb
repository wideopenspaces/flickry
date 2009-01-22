module Flickry
  class Size < Flickry::Base
    def initialize(sz)
      super(nil)
      extract_attrs!(sz, [:height, :width, :media, :source, :url])
    end 
    
    def to_url
      clean(self.url)
    end
    
    def to_source
      clean(self.source)
    end
    
  end
end