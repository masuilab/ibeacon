require 'httparty'
require 'ltsv'

url = ARGV.shift || 'https://raw.githubusercontent.com/masuilab/ibeacon/master/beacons.ltsv'

res = HTTParty.get(url)

if res.code != 200
  STDERR.puts res.body
  exit 1
end

LTSV.parse(res.body).each do |beacon|
  puts beacon
end
