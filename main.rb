require 'erb'
require './project_template.rb'
require 'fileutils'
template_folder="./template_folder"
new_project_folder="./new_folder"

if File.exists? (new_project_folder)
	$stderr.puts "Destination Folder already exists!"
end
FileUtils.copy_entry(template_folder, new_project_folder)
project_template = ProjectTemplate.new("ganesha_sample")
template_files = Dir.glob("#{new_project_folder}/**/*.template")
template_files.each {|t|
	renderer = ERB.new(File.read(t))
	output_file = File.join(File.dirname(t), File.basename(t, ".template"))
	File.open(output_file, "w"){|f|
		f.write(renderer.result(project_template.get_binding))
	}
	FileUtils.rm_rf(t)
}
