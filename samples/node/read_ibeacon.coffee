request = require 'request'
ltsv = require 'ltsv'

url = process.argv[2] or 'https://raw.githubusercontent.com/masuilab/ibeacon/master/beacons.ltsv'

request url, (err, res, body) ->
  if err or res.statusCode != 200
    console.error body
    process.exit 1
  for beacon in ltsv.parse(body)
    console.log beacon
