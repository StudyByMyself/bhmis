_db = require '../db-connection'
_verify = require './verify'
class Base
  constructor: (@table)->
    @knex = _db.getConnection()
  find: (query)->
    @knex.select().where(query).table(@table)

  save: (data)->
    legal = _verify.isLegal @table, data
    data.timestamp = new Date().getTime()
    return null if not legal
    @knex.insert(data).into(@table)

  update: ()->

  findAll: ()->
    @knex.select().table(@table)

  getSchemaFields: ()->
    schemaPath = "../schema/#{@table}"
    schema = require(schemaPath).fields
    fields = []
    fields.push field for field of schema
    return fields


module.exports = Base