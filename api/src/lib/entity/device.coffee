_Base = require './base'

class Device extends _Base
  constructor: ()->
    super 'device'

  #获取不重复的字段
  getDistinctValue: (field)->
    @knex.distinct(field).select().table(@table)

module.exports = new Device()