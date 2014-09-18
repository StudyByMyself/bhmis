_DeviceTest = require './test/device-test'

doTest = ()->
  tasks = _DeviceTest.tasks()
  _DeviceTest[task]() for task in tasks

doTest()