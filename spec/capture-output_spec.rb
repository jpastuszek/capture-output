require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Capture do
  it "#stdout should capture all STDOUT IO content" do
		Capture.stdout do
			pid = Process.spawn('echo "hello world"')
			Process.wait pid
			STDOUT.puts 'puts'
		end.should == "hello world\nputs\n"
  end

  it "#stderr should capture all STDERR IO content" do
		Capture.stderr do
			pid = Process.spawn('echo "hello world" 1>&2')
			Process.wait pid
			STDERR.puts 'puts'
		end.should == "hello world\nputs\n"
  end

	it "#stdout and #stderr in combination" do
		Capture.stdout do
			Capture.stderr do
				pid = Process.spawn('echo "hello world out"')
				Process.wait pid
				pid = Process.spawn('echo "hello world err" 1>&2')
				Process.wait pid
			end.should == "hello world err\n"
		end.should == "hello world out\n"
	end
end
