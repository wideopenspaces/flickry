module Flickry
  class Photo < Flickry::Base
    def initialize(flickr_id)
      super(nil)
      foto = flickr.photos.getInfo(:photo_id => flickr_id)
      self.raw_photo = foto
      self.photo_id = flickr_id

      extract_attrs!(foto, [:dateuploaded, :description, :farm, :id, :isfavorite,
        :media, :notes, :originalformat, :originalsecret, :rotation, :secret, :server, :tags,
        :title])
      extract_attrs_into_substructs!(foto, {
        :dates        => [:lastupdate, :posted, :taken, :takengranularity],
        :editability  => [:canaddmeta, :cancomment],
        :geoperms     => [:iscontact, :isfamily, :isfriend, :ispublic],
        :usage        => [:canblog, :candownload, :canprint],
        :visibility   => [:isfamily, :isfriend, :ispublic]
      })
      self.location = Flickry::Location.new(foto.respond_to?(:location) ? foto.location : nil)
      self.owner    = Flickry::Person.find(foto.respond_to?(:owner) ? foto.owner.nsid : nil)
      self.license  = Flickry::License.new(foto.respond_to?(:license) ? foto.license : 99)
      _tags = self.tags.dup
      self.tags = _tags.collect do |t|
        Flickry::Tag.new(t)
      end
      self.urls = foto.urls.collect { |u| u.to_s }
    end

    ##  Sizes
    
    # Lazily fetches the photo's sizes when called, memoizes so later calls are faster...
    def sizes
      @sizes ||= Flickry::Sizes.new(flickr.photos.getSizes(:photo_id => self.photo_id))
    end
    
    ##  Comments
    
    # Lazily fetches the photo's comments when called, memoizes so later calls are faster...
    def comments
      return @comments if @comments
      
      if raw_photo.comments.to_i == 0
        @comments = []
      else
        @comments = []
        flickr_comments = flickr.photos.comments.getList(:photo_id => self.photo_id)
        flickr_comments.each do |comment|
          @comments << Flickry::Comment.new(comment)
        end
      end
      return @comments
    end 
    
    ##  Time/Dates
    def last_updated_at
      dates_to_time(:lastupdate)
    end
    
    def posted_at
      dates_to_time(:posted)
    end
    
    def taken_at
      Time.parse(self.dates.taken)
    end
    
    def uploaded_at
      uploaded = self.dateuploaded.to_i
      return nil if uploaded == 0
      Time.at(uploaded)    
    end
    
    ## Tags
    
    # Join tags into a single string 
    def tag_list(separator = ', ')
      self.tags.join(separator)
    end
    
    #W Booleans
    
    def favorite?
      self.isfavorite == 1
    end
    
    def visible_to_family?
      self.visibility.isfamily == 1
    end
    
    def visible_to_friends?
      self.visibility.isfriend == 1
    end
    
    def visible_to_public?
      self.visibility.ispublic == 1
    end
    
    private
    
    def dates_to_time(src)
      time = self.dates.send(src).to_i
      return nil if time == 0
      Time.at(time)
    end
    
  end
end