#
# uses People to produce a breakdown of 
# email domains and the count of validaccounts
# in each
#
email_breakdown = {}
Person.validaccounts.all.each do |p|
  if(p.email =~ %r{\.(\w+)$})
    email_breakdown[$1] ||= 0
    email_breakdown[$1] += 1
  end
end
email_breakdown.each do |domain,count|
  puts "#{domain} : #{count}"
end