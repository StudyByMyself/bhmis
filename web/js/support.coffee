app = angular.module 'application', []

app.service 'API', [
  '$http',
  ($http)->
    service = {}
    service.get = (url, query, cb)->
      if typeof query is 'function'
        cb = query
        query = {}

      config = params: query

      $http.get(url, config)
      .success((data)->
        cb && cb data
      ).error((error)->
        console.log error
      )
    return service
]

app.service 'DeviceService', ['API', (API)->
  service = {}
  #获取所有设备型号
  service.getDeviceList = (cb)->
    API.get '/api/device/support/device/list', cb

  #根据设备型号获取浏览器列表
  service.getBrowserList = (device, cb)->
    API.get '/api/device/support/device/browser/list', device: device, cb

  service.getSupportEventsList = (device, browser, cb)->
    query =
      device: device
      browser: browser

    API.get '/api/device/support/list', query, cb

  return service
]

app.controller 'DeviceCtrl',[
  '$scope',
  'DeviceService',
  ($scope, DeviceService)->

    bindSupportEventsData = (device, browser)->
      DeviceService.getSupportEventsList device, browser, (data)->
        $scope.supportEvents = data


    bindBrowserData = (device)->
      DeviceService.getBrowserList device, (data)->
        $scope.browserList = data
        $scope.browser = data[0]
        bindSupportEventsData device, $scope.browser

    #初始化select
    initSelect = ()->
      DeviceService.getDeviceList (data)->
        $scope.devices = data
        return if data.length is 0
        $scope.device = data[0]
        bindBrowserData $scope.device

    changeDevice = ()->
      bindBrowserData $scope.device

    showSupportEvents = ()->
      bindSupportEventsData $scope.device, $scope.browser

    $scope.changeDevice = changeDevice
    $scope.showSupportEvents = (browser)->
      $scope.browser = browser
      showSupportEvents()
    $scope.isActive = (browser)->
      browser is $scope.browser

    initSelect()
]


angular.bootstrap document, ['application']