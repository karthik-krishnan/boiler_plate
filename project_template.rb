class ProjectTemplate

	attr_accessor :project_name, :project_description, :classified_project_name
	
	def initialize(project_name, project_description=nil)
		@project_name = project_name
		@project_description = project_description || default_description(project_name)
	end

	def classified_project_name
		project_name.classify
	end

	def get_binding
    binding
	end

	private

	def classify(s)
		s.split('_').collect(&:capitalize).join
	end
	
	def default_description(s)
		s.split('_').collect(&:capitalize).join(" ")
	end
	
end