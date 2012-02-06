require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Capture do
  it "#stdout should capture all STDOUT IO content" do
		Capture.stdout do
			Process.spawn('echo "hello world"')
			STDOUT.puts 'puts'
		end.should == "hello world\nputs\n"
  end

  it "#stderr should capture all STDERR IO content" do
		Capture.stderr do
			Process.spawn('echo "hello world" 1>&2')
			STDERR.puts 'puts'
		end.should == "hello world\nputs\n"
  end

	it "#stdout and #stderr in combination" do
		Capture.stdout do
			Capture.stderr do
				Process.spawn('echo "hello world out"')
				Process.spawn('echo "hello world err" 1>&2')
			end.should == "hello world err\n"
		end.should == "hello world out\n"
	end
end
