// Generated by CoffeeScript 1.7.1
(function() {
  var Base;

  Base = (function() {
    function Base() {}

    Base.prototype.sendResult = function(resp, data, isCallBack) {
      if (isCallBack == null) {
        isCallBack = false;
      }
      if (isCallBack) {
        return resp.end("" + isCallBack + "(" + (JSON.stringify(data)) + ")");
      }
      return resp.end(JSON.stringify(data));
    };

    Base.prototype.clearData = function(data) {
      delete data.callback;
      return delete data._;
    };

    return Base;

  })();

  module.exports = Base;

}).call(this);
