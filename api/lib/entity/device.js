// Generated by CoffeeScript 1.7.1
(function() {
  var Device, _Base,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  _Base = require('./base');

  Device = (function(_super) {
    __extends(Device, _super);

    function Device() {
      Device.__super__.constructor.call(this, 'device');
    }

    Device.prototype.getDistinctValue = function(field) {
      return this.knex.distinct(field).select().table(this.table);
    };

    return Device;

  })(_Base);

  module.exports = new Device();

}).call(this);