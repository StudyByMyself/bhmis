// Generated by CoffeeScript 1.7.1
(function() {
  var Base, _db, _verify;

  _db = require('../db-connection');

  _verify = require('./verify');

  Base = (function() {
    function Base(table) {
      this.table = table;
      this.knex = _db.getConnection();
    }

    Base.prototype.find = function(query) {
      return this.knex.select().where(query).table(this.table);
    };

    Base.prototype.save = function(data) {
      var legal;
      legal = _verify.isLegal(this.table, data);
      data.timestamp = new Date().getTime();
      if (!legal) {
        return null;
      }
      return this.knex.insert(data).into(this.table);
    };

    Base.prototype.update = function() {};

    Base.prototype.findAll = function() {
      return this.knex.select().table(this.table);
    };

    Base.prototype.getSchemaFields = function() {
      var field, fields, schema, schemaPath;
      schemaPath = "../schema/" + this.table;
      schema = require(schemaPath).fields;
      fields = [];
      for (field in schema) {
        fields.push(field);
      }
      return fields;
    };

    Base.prototype._valueCopy = function(dest, ori) {
      var key, value;
      for (key in dest) {
        value = dest[key];
        if (ori[key] != null) {
          dest[key] = ori[key];
        }
      }
      return dest;
    };

    return Base;

  })();

  module.exports = Base;

}).call(this);
