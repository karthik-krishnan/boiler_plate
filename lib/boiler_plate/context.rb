module BoilerPlate
	module Base
		def inject_dynamic_attributes(props)
			props.each {|k,v|
				unless self.class.instance_methods.include? k
					#self.class.send(:attr_accessor, k)
					#self.instance_variable_set("@#{k}", v)
					singleton_class.send(:define_method, k) { v }
				end
			}
    	end

		def self.included(klass)
			klass.class_eval do
				def get_binding
					binding
				end
			end
		end
	end

	class Context
		include BoilerPlate::Base

		def initialize(props)
			inject_dynamic_attributes props
		end
	end
end