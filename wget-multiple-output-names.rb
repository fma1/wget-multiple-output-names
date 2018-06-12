if (ARGV.length < 3)
  puts "usage: ruby wget-multiple-output-names.rb [urlList] [startingName] [extension]" 
  puts "\n"
  puts "urlList is the file that contains all the links"
  puts "startingName is the name to start all output files with"
  puts "extension is the extension to append all output files with"
  exit(1)
end

urlList = ARGV[0]
startingName = ARGV[1]
extension = ARGV[2]

counter = 1
File.open(urlList).each do |line|
  file = "%s%02d.%s" % [startingName, counter, extension]
  counter = counter + 1
  cmd = "wget %s -O %s" % [line.strip(), file]
  puts "Executing \"%s\"" % cmd
  system(cmd)
end
