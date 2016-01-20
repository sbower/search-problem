#!/usr/bin/env ruby

require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: search.rb [options]"

  opts.on('--term1 TERM1', 'The first search term (required)') { |v| options[:term1] = v }
  opts.on('--term2 TERM2', 'The second saech term (required)') { |v| options[:term2] = v }
  opts.on('--context NUM', 'The number of words apart the two search terms are (required)') { |v| options[:context] = v }
  opts.on('--dir DIRECTORY', 'The directory to search (required)') { |v| options[:dir] = v }

  opts.on("-h", "--help", "Prints this help") do
    puts opts
    exit
  end

end.parse!

#raise excpetion if there is a missing option
raise OptionParser::MissingArgument if options[:term1].nil?
raise OptionParser::MissingArgument if options[:term2].nil?
raise OptionParser::MissingArgument if options[:context].nil?
raise OptionParser::MissingArgument if options[:dir].nil?

#compile the regex pattern
REGEX_PATTERN = "#{options[:term1]}\\W+(?:\\w+\\W+){0,#{options[:context]}}?#{options[:term2]}|#{options[:term2]}\\W+(?:\\w+\\W+){0,#{options[:context]}}?#{options[:term1]}"

#create regex parser
rp = Regexp.new(REGEX_PATTERN, true)

# loop through all the files in the specified the directory
Dir.foreach(options[:dir]) do |item|
  next if item == '.' or item == '..'

  # open file and slurp all the contents into a string
  file = File.open(options[:dir] + '/' + item, 'rb')
  contents = file.read

  # run the match and print the filename and matching string
  match_data = rp.match(contents)
  p "file_name: #{item} first matching string: " +  match_data[0] if !match_data.nil?
end
