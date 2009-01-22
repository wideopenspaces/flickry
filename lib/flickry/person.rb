module Flickry
  class Person < Flickry::Base
    def initialize(user)
      super(nil)
      extract_attrs!(user, [:location, :nsid, :realname, :username, :photosurl, :profileurl])
    end
    
    def self.find(nsid)
      if person = flickr.people.getInfo(:user_id => nsid)
        return new(person)
      else
        return nil
      end
    end
    
    def profile
      clean(self.profileurl)
    end
    
    def photos
      clean(self.photosurl)
    end
  end
end