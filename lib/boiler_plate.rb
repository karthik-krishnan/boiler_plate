require "boiler_plate/version"
require 'erb'
require 'java-properties'
require 'fileutils'
require 'boiler_plate/context'
require 'boiler_plate/runner'

module BoilerPlate
	def self.included(klass)
		klass.class_eval do
			include BoilerPlate::Base
			def load_context(props)
				inject_dynamic_attributes(props)
			end
		end
	end
end