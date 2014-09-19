_Base = require './base-test'
_entity = require '../entity/events'
_async = require 'async'
class DeviceTest extends _Base
  constructor: ()->
    super 'events'

  save: (cb)->
    data =  @generateLawData()
    _entity.saveOnlyOne data, (err, result)->
      cb()

  mulSave: ()->
    self = @
    queue = []
    for index in [0..1000]
      queue.push (next)->
        self.save next
    _async.whilst(
      ()->
        queue.length
     ,(cb)->
        action = queue.pop()
        action(cb)
     ,()->
        console.log 1
    )

  find: ()->
    query =
      device: "abc1"
      browser: "abc1"

    _entity.findSupport(query).then((rows)->
      console.log rows
    )

  tasks: ()->
    ['find']

module.exports = new DeviceTest()