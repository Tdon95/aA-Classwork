class AttrAccessorObject
    def self.my_attr_accessor(*ivars) #will make a method that will make a method w/name ivar
      ivars.each do |ivar|
        define_method(ivar) do 
            self.instance_variable_get("@#{ivar}")
        end
        define_method("#{ivar}=") do |value|
            self.instance_variable_set("@#{ivar}", value)
        end
      end
    end
end
