_DeviceTest = require './test/device-test'
_EventsTest = require './test/event-test'
doTest = ()->
  #require('./init-schema').init()
  Test = _EventsTest
  tasks = Test.tasks()
  Test[task]() for task in tasks

doTest()