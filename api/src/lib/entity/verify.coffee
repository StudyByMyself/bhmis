#检验数据正确性
Verify = module.exports = {}

Verify.isLegal = (table, data)->
  #schema = require "../schema/#{table}"
  #fields = schema.fields
  return true
#是否为表中的字段
Verify.isFields = (table, field)->
  schema = require "../schema/#{table}"
  fields = schema.fields
  fields[field]