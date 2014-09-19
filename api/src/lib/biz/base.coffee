class Base
  constructor: ()->

  sendResult: (resp, data, isCallBack = false)->
    return resp.end("#{isCallBack}(#{JSON.stringify(data)})") if isCallBack
    resp.end JSON.stringify data

  #清除冗余字段
  clearData: (data)->
    delete data.callback
    delete data._

module.exports = Base
