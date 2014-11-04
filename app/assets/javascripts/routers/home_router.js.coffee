class BackEndJobTest.Routers.Home extends Backbone.Router

  routes:
    '' : 'index'

  index: ->
    view = new BackEndJobTest.Views.HomeIndex()
    $('.navbar-collapse.collapse.navbar-responsive-collapse').html(view.render().el)
    $('#content').html((new BackEndJobTest.Views.Temperature()).render().el)
