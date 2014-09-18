module.exports =
  '/':
    biz: "device"
    method: "add"
  '/device/add':
    biz: "device"
    method: "add"
  '/device/fields':
    biz: "device"
    method: 'fields'
  '/device/fields/distinct':
    biz: "device"
    method: 'distinctFields'
  '/device/list':
    biz: "device"
    method: 'list'
  '/404':
    biz: "error"