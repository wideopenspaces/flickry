module Flickry
  class Comment < String
    attr_reader :comment_id, :author_id, :authorname, :datecreate, :permalink
    def initialize(comment)
      super(comment.to_s)
      @comment_id = comment.id
      @author_id = comment.author
      @authorname = comment.authorname
      @datecreate = comment.datecreate
      @permalink = comment.permalink
    end
    
    # datecreate converted into Time object
    def created_at
      Time.at(@datecreate.to_i)
    end
    
    # Get a Person record for the author_id
    def author
      Flickry::Person.find(@author_id)
    end
    
    # name = authornane
    def name
      @authorname
    end
  end
end