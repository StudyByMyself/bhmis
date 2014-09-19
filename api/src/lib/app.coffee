# app 入口
_http = require 'http'
_router = require './router'
_url = require 'url'

require('./init-schema').init()

server = (req, resp)->
  client = _url.parse(req.url, true)
  req.client = client
  _router(req, resp)

_http.createServer(server).listen(8000)