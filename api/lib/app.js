// Generated by CoffeeScript 1.7.1
(function() {
  var server, _http, _router, _url;

  _http = require('http');

  _router = require('./router');

  _url = require('url');

  require('./init-schema').init();

  server = function(req, resp) {
    var action, actionConfig, biz, client, method, pathname, reg;
    client = _url.parse(req.url, true);
    req.client = client;
    pathname = client.pathname;
    reg = /^(\/api)/;
    if (reg.test(pathname)) {
      pathname = pathname.replace(reg, '');
    }
    actionConfig = _router[pathname];
    if (!actionConfig) {
      actionConfig = _router['/404'];
    }
    biz = actionConfig.biz;
    method = actionConfig.method || 'execute';
    action = require("./biz/" + biz);
    return action[method](req, resp);
  };

  _http.createServer(server).listen(8000);

}).call(this);