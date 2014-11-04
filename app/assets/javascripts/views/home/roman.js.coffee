class BackEndJobTest.Views.Roman extends Backbone.View
  template: JST['home/roman']
  className: "col-lg-12 col-sm-12"

  initialize: ->
    @collection = new BackEndJobTest.Collections.Romans()

  events:
    'keyup #roman_l' : 'roman'
    'keydown #roman_l' : 'romanCheck'

  render: ->
    $(@el).html(@template())
    @

  # submit the form on key press of roman letter
  roman: (e)->
    e.preventDefault()
    @collection.fetch
      wait: true
      data:
        roman: $('#roman_l').val()
      success: (collection, response, options) ->
        roman = collection.models[0]
        $('#integer').val(roman.get('integer'))
        $('#roman_s').val(roman.get('roman'))

  # check if the input is a roman numeric digit
  romanCheck: (e)->
    specialKeys = [8]
    keyCode = (if e.which then e.which else e.keyCode)
    if !_.contains [73, 86, 88, 76, 67, 68, 77], keyCode
      e.preventDefault()
      false


