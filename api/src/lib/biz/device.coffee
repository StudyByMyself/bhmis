_entity = require '../entity/device'

sendResult = (resp, data, isCallBack = false)->
  return resp.end("#{isCallBack}(#{JSON.stringify(data)})") if isCallBack
  resp.end JSON.stringify data

#清楚对于字段
clearData = (data)->
  delete data.callback
  delete data._


#添加一个设备信息 #提供给jsonp格式
exports.add = (req, resp)->
  data = req.client.query
  callback = data.callback
  clearData data
  #是否已经存在了该数据。
  _entity.find(data).then((rows)->
    _entity.save(data).then((ids)->
      result =
        status: true
        ids: ids
      sendResult resp, result, callback
    ) if rows.length is 0
    #已经存在 则不继续保存
    reslut =  status: true
    sendResult resp, reslut, callback  if rows.length

  ).catch((error)->
    result = status: false
    sendResult resp, result, callback
  )

#获取设备有哪些属性
exports.fields = (req, resp)->
  data = req.client.query
  callback = data.callback
  fields = _entity.getSchemaFields()
  sendResult resp, fields, callback

exports.distinctFields = (req, resp)->
  data = req.client.query or {}
  field = data.field or ''
  _entity.getDistinctValue(field).then (raws)->
    sendResult resp, raws, data.callback

exports.list = (req, resp)->
  data = req.client.query
  callback = data.callback
  clearData data
  _entity.find(data).then((raws)->
    sendResult resp, raws, callback
  )