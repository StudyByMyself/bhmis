(function() {
  module.exports = {
    "environment": "develop",
    "develop": {
      "port": 3000,
      "base": {
        "index": "index.html",
        "cache-time": 60 * 60 * 24 * 7,
        "gzip": true,
        "isWatchFile": true,
        "showResponseTime": true
      },
      "proxy": {
        "path": /^\/api/,
        "options": {
          "target": "http://192.168.8.108:8989"
        }
      },
      "error": {
        "403": ''
      }
    },
    "product": {
      "port": 3000,
      "base": {
        "index": "index.html",
        "cache-time": 60 * 60 * 24 * 7,
        "gzip": true,
        "isWatchFile": true,
        "showResponseTime": false
      },
      "proxy": {
        "path": "/api",
        "redirect": "http://localhost:8001"
      },
      "error": {
        "403": ''
      }
    }
  };

}).call(this);
