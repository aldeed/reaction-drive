UI.body.events
  'click #explore-now': () ->
    $('#introduction').fadeOut 200, ->
      $('.explore-now-container').fadeIn()
      return
    return

  'click #explore-close': () ->
    $('.explore-now-container').fadeOut 200, ->
      $('#introduction').fadeIn()
      return
    return



# Template.explorenow.rendered = () ->
#   $('#explore-now-block').fadeIn()