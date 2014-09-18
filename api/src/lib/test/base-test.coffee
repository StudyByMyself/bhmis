_crypto = require 'crypto'
_uuid = require 'node-uuid'

class Base
  constructor: (@table)->
    require('../init-schema').init()

  #生成测试数据
  generateTestData: ()->
    schema = require "../schema/#{@table}"
    data = {}
    data[key] = @generateString() for key, vlaue of schema.fields
    data.timestamp = new Date().getTime()
    return data

  #生成想同的测试数据
  generateSameTestData: ()->
    schema = require "../schema/#{@table}"
    data = {}
    data[key] = "abc" for key, vlaue of schema.fields
    return data

  generateString: (length = 8)->
    _uuid.unparse(_crypto.pseudoRandomBytes(length)).substr(0, length)


module.exports = Base