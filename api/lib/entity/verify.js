// Generated by CoffeeScript 1.7.1
(function() {
  var Verify;

  Verify = module.exports = {};

  Verify.isLegal = function(table, data) {
    return true;
  };

  Verify.isFields = function(table, field) {
    var fields, schema;
    schema = require("../schema/" + table);
    fields = schema.fields;
    return fields[field];
  };

}).call(this);
