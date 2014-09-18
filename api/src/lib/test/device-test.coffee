_Base = require './base-test'
_entity = require '../entity/device'
class DeviceTest extends _Base
  constructor: ()->
    super 'device'

  save: ()->
    #data = @generateTestData()
    data = @generateSameTestData()
    sql = _entity.save data
    sql.then(()->
      console.log arguments
    )

  findAll: ()->
    _entity.findAll().then((rows)->
      console.log rows
    )

  find: ()->
    query = browser: "browser2"
    _entity.find(query).then((rows)->
      console.log rows
    )

  generateTestData: ()->
    super

  getDistinctValue:()->
    _entity.getDistinctValue('ua1').then((rows)->
      console.log rows
    )


  tasks: ()->
    ['save']

module.exports = new DeviceTest()