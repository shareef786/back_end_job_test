class BackEndJobTest.Views.Temperature extends Backbone.View

  template: JST['home/temperature']
  className: "col-lg-12 col-sm-12"

  events:
    'keydown .form-control' : 'isNumeric'
    'keyup .form-control'   : 'temperature'

  render: ->
    $(@el).html(@template())
    @

  temperature: (e)->
    e.preventDefault()
    c_el = $(@el).find('#temperature_c')
    f_el = $(@el).find('#temperature_f')

    if $(e.target).attr('id') == 'temperature_c' && $(c_el).val().length > 0
      f = ($(c_el).val()  * 9 / 5 + 32).toFixed(2)
      $(f_el).val(f)
    else if $(e.target).attr('id') == 'temperature_f' && $(f_el).val().length > 0
      c = (($(f_el).val() - 32 ) * 5 / 9 ).toFixed(2)
      $(c_el).val(c)
    else
      $(@el).find('.form-control').val('')


  isNumeric: (e) ->
    specialKeys = [8]
    keyCode = (if e.which then e.which else e.keyCode)
    if !((keyCode >= 48 && keyCode <= 57) or specialKeys.indexOf(keyCode) isnt -1)
      e.preventDefault()
      false
