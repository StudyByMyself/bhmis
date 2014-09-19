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
    console.log data
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

module.exports = new Events()