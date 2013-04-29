# parses the mailman archives dirs to look at the latest archive dates
require 'date'
lists = Dir.entries('.').reject{|d| (d == '.' || d == '..' || d =~ %r{\.mbox})}
lists.sort.each do |list|
  archives = Dir.entries("./#{list}").collect{|a| (a =~ %r{(\d+)-(\w+)\.txt} ? Date.strptime("#{$1}-#{$2}","%Y-%B") : nil)}.compact
  last_used = archives.max
  if(archives.max)
    is_last_year = (last_used >= Date.strptime('2012-April',"%Y-%B")) ? 'true' : 'false'
    puts "#{list},#{is_last_year},#{last_used.to_s}"
  else
    puts "#{list},false,Never"
  end
end