module Flickry
  class Sizes < Flickry::Base
    def initialize(szs)
      super(nil)
      szs.each do |sz|
        self[sz.label.downcase.to_sym] = Flickry::Size.new(sz)
      end
    end
  end
end