# capture-output

Capture STDOUT, STDERR or other IO output and return it as a string.

This is useful for testing when you need to start a process and check its output or when you need to check current process output.

## Installing

    gem install capture-output

## Usage

Grab STDOUT:

```ruby
require 'capture-output'

out = Capture.stdout do
	Process.spawn('echo "hello world"')
	STDOUT.puts 'puts'
end
# out contains "hello world\nputs\n"
```

Grab STDERR:

```ruby
require 'capture-output'

out = Capture.stderr do
	Process.spawn('echo "hello world" 1>&2')
	STDERR.puts 'puts'
end
# out contains "hello world\nputs\n"
```

Grab STDOUT and STDERR:

```ruby
require 'capture-output'

err = nil
out = Capture.stdout do
	err = Capture.stderr do
		Process.spawn('echo "hello world out"')
		Process.spawn('echo "hello world err" 1>&2')
	end
end
# err contains "hello world err\n"
# out contains "hello world out\n"
```

## Contributing to caputer-output
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 Jakub Pastuszek. See LICENSE.txt for
further details.

