# BoilerPlate

This project helps to quickly templatize an entire folder based on a set of configured inputs given in the form of a properties file.  Comes in handy if you have a project folder and want to quickly replicate it as a boiler plate baseline for new projects.

## Installation

Add this line to your application's Gemfile:

```ruby
source 'https://rubygems.org'
gem 'boiler_plate', :git => 'https://github.com/karthik-krishnan/boiler_plate'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install boiler_plate

## Usage

### Making a file as template
 1. Replace any place in a file with ERB syntax <%= <i>variable_name</i> %>
 2. Rename the file by adding a suffix <i>'.template'</i>

### What if I want to rename a file or folder with a template variable?
 1. Enclose the variable_name part of the file/folder name within <i>[]</i>, eg: some_[variable_name]

### Attributes from a simple map
```ruby
	require 'boiler_plate'
	include BoilerPlate

	attrs = {:foo => 'bar'}
	context = BoilerPlate::Context.new(attrs)
	BoilerPlate::Runner.new(context, "./template_folder", "./new_folder").run
```

### Attributes from Java Properties
```ruby
	require 'boiler_plate'
	include BoilerPlate

	context = BoilerPlate::Context.new(JavaProperties.load("some_properties_file"))
	BoilerPlate::Runner.new(context, "./template_folder", "./new_folder").run
```

### Attributes with additional custom replacement
```ruby
	require 'boiler_plate'

	#My Custom Class
	class MyContext
		include BoilerPlate

		def initialize
			load_context JavaProperties.load("some_properties_file")
		end

		def some_attribute
			"my custom value"
		end

		def some_new_attribute
			"some value"
		end

	end
	context = MyContext.new
	BoilerPlate::Runner.new(context, "./template_folder", "./new_folder").run

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/boiler_plate. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
