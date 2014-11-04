class BackEndJobTest.Views.HomeIndex extends Backbone.View

  template: JST['home/index']
  tagName: "ul class='nav navbar-nav'"

  events:
    'click #roman'        : 'renderRoman'
    'click #temperature'  : 'renderTemperature'

  render: ->
    $(@el).html(@template())
    @

  renderRoman: (e)->
    e.preventDefault()
    $('#content').html((new BackEndJobTest.Views.Roman()).render().el)
    $('#roman, #temperature').parent('li').toggleClass('active')

  renderTemperature: (e)->
    e.preventDefault()
    $('#content').html((new BackEndJobTest.Views.Temperature()).render().el)
    $('#roman, #temperature').parent('li').toggleClass('active')
