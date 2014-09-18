# app 入口
_http = require 'http'
_router = require './router'
_url = require 'url'

require('./init-schema').init()

server = (req, resp)->
  client = _url.parse(req.url, true)
  req.client = client
  pathname =  client.pathname
  reg = /^(\/api)/
  pathname = pathname.replace reg, '' if reg.test pathname
  actionConfig = _router[pathname]
  actionConfig = _router['/404'] if not actionConfig
  biz = actionConfig.biz
  method = actionConfig.method or 'execute'
  action = require "./biz/#{biz}"
  action[method](req, resp)


_http.createServer(server).listen(8000)