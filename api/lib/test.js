// Generated by CoffeeScript 1.7.1
(function() {
  var doTest, _DeviceTest;

  _DeviceTest = require('./test/device-test');

  doTest = function() {
    var task, tasks, _i, _len, _results;
    tasks = _DeviceTest.tasks();
    _results = [];
    for (_i = 0, _len = tasks.length; _i < _len; _i++) {
      task = tasks[_i];
      _results.push(_DeviceTest[task]());
    }
    return _results;
  };

  doTest();

}).call(this);
