_fs = require 'fs'
_path = require 'path'
class Readme
  constructor: ()->

  execute: (req, resp)->
    readmePath = _path.join __dirname, "../readme.html"
    html = _fs.readFileSync readmePath, 'utf8'
    resp.write html
    resp.end()

module.exports = new Readme()