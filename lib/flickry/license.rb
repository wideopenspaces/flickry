# Flickr has an API method for getting information about licenses
# but it probably doesn't change all that often. 
module Flickry
  class License < String
    attr_accessor :name, :url
    def initialize(license)
      @name, @url = case id.to_i  # License Name                                     Information URL
      when 1:       ["Attribution-NonCommercial-ShareAlike License",  "http://creativecommons.org/licenses/by-nc-sa/2.0/"]
      when 2:       ["Attribution-NonCommercial License",             "http://creativecommons.org/licenses/by-nc/2.0/"]
      when 3:       ["Attribution-NonCommercial-NoDerivs License",    "http://creativecommons.org/licenses/by-nc-nd/2.0/"]
      when 4:       ["Attribution License",                           "http://creativecommons.org/licenses/by/2.0/"]
      when 5:       ["Attribution-ShareAlike License",                "http://creativecommons.org/licenses/by-sa/2.0/"]
      when 6:       ["Attribution-NoDerivs License",                  "http://creativecommons.org/licenses/by-nd/2.0/"]
      when 7:       ["No known copyright restrictions",               "http://flickr.com/commons/usage/"]
      else 
                    ["All Rights Reserved",                           ""]
      end
      
      super(@name)
    end
  end
end
