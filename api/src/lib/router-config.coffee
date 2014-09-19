module.exports =
  '/':
    biz: "readme"
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
  '/device/support/device/list':
    biz: "events"
    method: 'deviceList'
  '/device/support/device/browser/list':
    biz: "events"
    method: 'browserList'
  '/404':
    biz: "error"