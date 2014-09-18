
exports.execute = (req, resp)->
  resp.statusCode = 404
  resp.end('No found. 123')