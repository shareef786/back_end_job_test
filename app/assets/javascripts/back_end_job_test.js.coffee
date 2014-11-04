window.BackEndJobTest =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new BackEndJobTest.Routers.Home()
    Backbone.history.start()

$(document).ready ->
  BackEndJobTest.initialize()
