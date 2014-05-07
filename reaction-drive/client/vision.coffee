Template.vision.events
  'click #explore-now': () ->
    $('#vision-jumbotron-wrapper').fadeOut 200, ->
      $('.explore-now-container').fadeIn()
      return
    return

  'click #explore-close': () ->
    $('.explore-now-container').fadeOut 200, ->
      $('#vision-jumbotron-wrapper').fadeIn()
      return
    return
