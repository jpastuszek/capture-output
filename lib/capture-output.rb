module Capture
	def self.output(out = STDOUT)
		r, w = IO.pipe
		old_out = out.clone
		out.reopen(w)
		data = ''

		t = Thread.new do
			data << r.read
		end

		begin
			yield
		ensure
			w.close
			out.reopen(old_out)
		end
		t.join
		data
	end

	def self.stdout(&block)
		output(STDOUT, &block)
	end

	def self.stderr(&block)
		output(STDERR, &block)
	end
end

