#建表
_fs = require 'fs'
_path = require 'path'
_async= require 'async'
_knex = require('./db-connection').getConnection()
_Log = require 'log4slow'

#扫描schema数据结构
scanSchema = (dir = 'schema')->
  #获取schema目录
  dir = _path.join __dirname, dir
  files = _fs.readdirSync dir
  queue = []
  for file in files
    filePath = _path.join dir, file
    queue.push require filePath if _fs.statSync(filePath).isFile()
  return queue

#创建表
createSchema = (name, fields)->
  _knex.schema.createTable(name,(table)->
    _Log.info "创建表 #{name} 成功！"
    table.increments('id').primary();
    table[value] key for key, value of fields
    table.bigInteger 'timestamp'
  )


#更新表字段
updateSchema = (name, fields)->
  _Log.info "--- update table #{name} begin..."
  queue = []
  for key, value of fields
    queue.push
      key: key
      value: value

  dbTable = _knex.schema.table
  _async.whilst(
    ()->
      return queue.length
    ,(cb)->
      column = queue.pop()
      _knex.schema.hasColumn(name, column.key).then(
        (exists)->
          return cb() if exists
          dbTable(name, (table)->
            table[column.value] column.key
            _Log.info "update #{column.key} success"
            cb()
          )
      )
    ,(err)->
      _Log.info "--- update table #{name} finish."
  )


#创建或者更新表
buildSchema = (schema)->
  name = schema.name
  fields = schema.fields
  _knex.schema.hasTable(name).then (exists)->
    if exists
      updateSchema name, fields
    else
      createSchema name, fields

exports.init = ()->
  schemas =scanSchema()
  buildSchema schema for schema in schemas
