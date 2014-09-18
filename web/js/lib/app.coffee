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
  service.getProperties = (cb)->
    API.get '/api/device/fields', cb

  #根据设备信息的某个属性 获取该属性下所有不重复的字段。
  service.getDistinctValue = (field, cb)->
    API.get '/api/device/fields/distinct', field: field, cb

  #根据设备的某个属性及其值 获取所有的设备信息。
  service.getDeviceList = (query, cb)->
    API.get '/api/device/list', query, cb

  service.save = (data, cb)->
    API.get 'api/device/add', data, cb

  return service
]

app.controller 'DeviceCtrl',[
  '$scope',
  'DeviceService',
  ($scope, DeviceService)->
    #显示具体设备列表
    showDevicesList = (devicePropertyValue)->
      #控制页面样式使用
      $scope.activeDistinctPropertyValue = devicePropertyValue
      query = {}
      query[$scope.devicePropertyName] = devicePropertyValue
      DeviceService.getDeviceList query, (data)->
        $scope.deviceList = data

    #获取设备某个属性下的所有不重复的值
    setDeviceDistinctProperties = (field)->
      DeviceService.getDistinctValue field, (data)->
        queue = []
        queue.push item[field] for item in  data
        #默认选中第一个
        $scope.activeDistinctPropertyValue = queue[0]
        $scope.deviceDistinctProperties = queue
        showDevicesList $scope.activeDistinctPropertyValue
    #过滤器改变时发生
    $scope.changeDeviceProperty = ()->
      setDeviceDistinctProperties $scope.devicePropertyName

    #突出显示选择项
    $scope.isActive = (property)->
      property is $scope.activeDistinctPropertyValue

    $scope.showDevicesList = showDevicesList

    #初始化select
    initSelect = ()->
      DeviceService.getProperties (data)->
        $scope.deviceProperties = data
        $scope.devicePropertyName = $scope.deviceProperties[0]
        #获取该字段下的所有不重复的值
        setDeviceDistinctProperties $scope.devicePropertyName
    initSelect()
  ]


angular.bootstrap document, ['application']