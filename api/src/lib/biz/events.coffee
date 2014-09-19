_entity = require '../entity/events'
_Base = require './base'

class Events extends  _Base
  constructor: ()->
    super

  add: (req, resp)->
    self = @
    data = req.client.query
    callback = data.callback
    self.clearData data
    _entity.saveOnlyOne data, (error)->
      status = if error then false else true
      result =
        status: status
      self.sendResult resp, result, callback

  list: (req, resp)->
    self = @
    data = req.client.query
    callback = data.callback
    self.clearData data
    _entity.findSupport(data).then((rows)->
      queue = []
      queue.push row.support for row in rows
      self.sendResult resp, queue, callback
    )

  deviceList: (req, resp)->
    self = @
    data = req.client.query
    callback = data.callback
    _entity.findDeviceList().then((rows)->
      queue = []
      queue.push row.device for row in rows
      self.sendResult resp, queue, callback
    )

  browserList: (req, resp)->
    self = @
    data = req.client.query
    callback = data.callback
    device = data.device
    _entity.findBrowserListByDevice(device).then((rows)->
      queue = []
      queue.push row.browser for row in rows
      self.sendResult resp, queue, callback
    )

module.exports = new Events()