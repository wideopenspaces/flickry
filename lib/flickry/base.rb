module Flickry
  class Base < SuperStruct
    def initialize(*args)
      super(*args)
    end
    
    protected
  
    def extract_attrs_into_substructs!(src, mapping, default =  nil)
      mapping.each do |obj, attr_names|
        os = SuperStruct.new
        attr_names.each do |name|
          if src.respond_to?(obj) and sub = src.send(obj)
            os[name] = (sub.respond_to?(name) ? sub.send(name) : default)
          end  
        end
        self[obj] = os
      end
    end
  
    def extract_attrs!(src, attr_names, default = nil)
      attr_names.each do |name|
        self[name] = (src.respond_to?(name) ? src.send(name) : default)
      end
    end
  
    def extract_attrs(src, attr_names, default = nil)
      str = SuperStruct.new
      attr_names.each do |name|
        str[name] = (src.respond_to?(name) ? src.send(name) : default)
      end
      return str
    end
  end
end