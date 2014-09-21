require 'open-uri'
require 'zlib'
require 'yajl'

def readsave(date)
	gz = open("http://data.githubarchive.org/#{date}.json.gz")
	js = Zlib::GzipReader.new(gz).read

	# file = File.open("Users/diginori/study/skproject/githubarchive.org/#{date}.log", "w")

	Yajl::Parser.parse(js) do |event|
	  
	  begin
	    pushed_at = event["repository"]["pushed_at"]
		url = event["repository"]["url"]
		forks = event["repository"]["forks"]

		# file.write("#{pushed_at},#{url},#{forks}")
		puts "#{pushed_at},#{url},#{forks}"
	  rescue
	    puts "ERR"
	  end
	  
	end

	# file.close unless file == nil

	puts "#{date}"
end

for date in "2012-04-11-1".."2012-04-12-23"
	readsave(date)
end

