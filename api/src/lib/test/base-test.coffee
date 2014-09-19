_crypto = require 'crypto'
_uuid = require 'node-uuid'

class Base
  constructor: (@table)->

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

  #生成随机字符串
  generateString: (length = 8)->
    _uuid.unparse(_crypto.pseudoRandomBytes(length)).substr(0, length)

  #生成随机数字
  generateRandomNumber: (number = 1000)->
    Math.ceil(Math.random()*number)

  #生成有规律的数据
  generateLawData: ()->
    schema= require "../schema/#{@table}"
    data = {}
    data[key] = "abc#{@generateRandomNumber(5)}" for key, value of schema.fields
    return data

module.exports = Base