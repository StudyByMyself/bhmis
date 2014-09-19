_config = require './router-config'

module.exports = (req, resp)->
  client = req.client
  pathname =  client.pathname
  reg = /^(\/api)/
  #如果来自于http代理请求。
  pathname = pathname.replace reg, '' if reg.test pathname
  actionConfig = _config[pathname]
  actionConfig = _config['/404'] if not actionConfig
  biz = actionConfig.biz
  method = actionConfig.method or 'execute'
  action = require "./biz/#{biz}"
  action[method](req, resp)