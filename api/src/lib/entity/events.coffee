_async = require 'async'
_Base = require './base'
class Events extends _Base
  constructor: ()->
    super 'events'

  saveOnlyOne: (data, cb)->
    self = @
    queue = []
    queue.push (next)->
      #找到该记录则跳过不保存
      self.find(data).then((rows)->
        if rows.length
          return cb && cb()
        next()
      )

    queue.push (next)->
      self.save(data)
          .then((id)->
            next(null, id)
          ).catch((error)->
            next(error)
          )

    _async.waterfall queue, (err, result)->
      cb && cb(err, result)

  findSupport: (data)->
    query =
      device: ""
      browser: ""
    @_valueCopy query, data
    @knex.select('support').where(query).from(@table)

module.exports = new Events()