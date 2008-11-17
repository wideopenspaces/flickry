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
      
      self.sizes    = Flickry::Sizes.new(flickr.photos.getSizes(:photo_id => self.photo_id))
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

    def to_flickr_photo
      { :secret => self.secret,
        :originalsecret => self.originalsecret,
        :farm => self.farm,
        :server => self.server,
        :content_type => self.originalformat,
        :content => self.description,
        :created_at => Time.parse(self.dates.taken) }
    end

    def to_story
      return {:title => self.title, :slug => self.photo_id, :published_at => self.dates.taken }
    end

  end
end