module.exports =
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
  '/device/support':
    biz: "events"
    method: 'add'
  '/device/support/list':
    biz: "events"
    method: 'list'
  '/404':
    biz: "error"