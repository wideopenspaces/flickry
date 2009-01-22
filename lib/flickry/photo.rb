module Flickry
  class Photo < Flickry::Base
    def initialize(flickr_id)
      super(nil)
      foto = flickr.photos.getInfo(:photo_id => flickr_id)
      self.photo_id = flickr_id

      extract_attrs!(foto, [:comments, :dateuploaded, :description, :farm, :id, :isfavorite, :license,
        :media, :notes, :originalformat, :originalsecret, :rotation, :secret, :server, :tags,
        :title, :urls])
      extract_attrs_into_substructs!(foto, {
        :dates        => [:lastupdate, :posted, :taken, :takengranularity],
        :editability  => [:canaddmeta, :cancomment],
        :geoperms     => [:iscontact, :isfamily, :isfriend, :ispublic],
        :usage        => [:canblog, :candownload, :canprint],
        :visibility   => [:isfamily, :isfriend, :ispublic]
      })
      self.location = Flickry::Location.new(foto.respond_to?(:location) ? foto.location : nil)
      self.owner    = Flickry::Person.new(foto.respond_to?(:owner) ? foto.owner : nil)
        
    end

    # Lazily fetches the photo's sizes when called, memoizes so later calls are faster...
    def sizes
      @sizes ||= Flickry::Sizes.new(flickr.photos.getSizes(:photo_id => self.photo_id))
    end
    
    # Lazily fetches the photo's comments when called, memoizes so later calls are faster...
    def comments
      return @comments if @comments
      
      if foto.comments.to_i == 0
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
    
    def visible_to_family?
      self.visibility.isfamily == 1
    end
    
    def visible_to_friends?
      self.visibility.isfriend == 1
    end
    
    def visible_to_public?
      self.visibility.ispublic == 1
    end
    
  end
end