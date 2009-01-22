module Flickry
  class Comment < Flickry::Base
    def initialize(comment)
      super(nil)
      @comment_id = comment.id
      extract_attrs!(comment, [:authorname, :datecreate, :permalink])
      self.content = comment.to_s
      self.author_id = comment.author
    end
    
    def comment_id
      @comment_id
    end
    
    def to_s
      self.content
    end
    
    # Clean permalink
    def to_url
      clean(self.permalink)
    end
    
    # datecreate converted into Time object
    def created_at
      Time.at(self.datecreate.to_i)
    end
    
    # Get a Person record for the author_id
    def author
      Flickry::Person.find(self.author_id)
    end
    
    # name = authornane
    def name
      self.authorname
    end
  end
end