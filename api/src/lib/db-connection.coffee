#获取数据库连接

_knex = require 'knex'
_config = require './db-config'

dbConnection = _knex(_config)

exports.getConnection = ()->
  dbConnection