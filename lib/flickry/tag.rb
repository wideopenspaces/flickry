module Flickry
  class Tag < String
    attr_reader :tag_id, :machine_tag, :author_id, :name
    def initialize(tag)
      super(tag.to_s)
      @tag_id       = tag.id
      @machine_tag  = tag.machine_tag
      @author_id    = tag.author
      @name         = self.to_s
    end
    
    def machine_tag?
      @machine_tag == 0 ? false : true
    end
    
    # Get a Person record for the author_id
    def author
      Flickry::Person.find(@author_id)
    end
  end
end