module Flickry
  class Person < Flickry::Base
    def initialize(user)
      super(nil)
      extract_attrs!(user, [:location, :nsid, :realname, :username])
    end
  end
end