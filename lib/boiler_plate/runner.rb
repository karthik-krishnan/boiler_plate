module BoilerPlate
	class Runner
		attr_accessor :context, :template_folder, :destination_folder

		def initialize(context, template_folder, destination_folder)
			@context = context
			@template_folder = template_folder
			@destination_folder = destination_folder
		end

		def run
			start_time = Time.now
			print "Checking if destination folder exists..."
			if File.exists? (destination_folder)
				$stderr.puts "Destination Folder already exists, aborting!"
				exit
			end
			puts "done"

			print "Creating Replica..."
			FileUtils.copy_entry(template_folder, destination_folder)
			puts "done"

			templatize
			puts "Completed in #{((Time.now - start_time)*1000).round} msecs"
		end

		def templatize
			template_files = Dir.glob("#{destination_folder}/**/*.template")
			puts "Total templates to be processed = #{template_files.count}"
			template_files.each {|t|
				base_name = File.basename(t, ".template")
				print "Processing #{base_name}..."
				renderer = ERB.new(File.read(t))
				output_file = File.join(File.dirname(t), base_name)
				File.open(output_file, "w"){|f|
					f.write(renderer.result(context.get_binding))
				}
				FileUtils.rm_rf(t)
				puts "done"
			}
		end
	end
end