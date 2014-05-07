Template.vision.helpers
  featureList: () ->
    # fetches from a google docs spreadhsheet, with "Feature, Description, Status" cells
    Meteor.http.get "https://spreadsheets.google.com/feeds/list/1RbFeRPpQVl6Pxz2S8D7glWBNHQ2qOedQI5sOcB-qa3I/od6/public/values?alt=json",  (error,result) ->
      console.log "error:",error if error
      features = []
      for item in result.data.feed.entry
        status = item.gsx$status.$t.toLowerCase()
        if status
          statusClass = switch status
            when "alpha" then "alpha-ribbon"
            when "beta" then "beta-ribbon"
            else "vision-ribbon"
        else
          statusClass = "vision-ribbon"
          status = "vision"
        if item.gsx$feature.$t?
          features.push feature: item.gsx$feature.$t, description: item.gsx$description.$t, status: status, statusClass: statusClass
      #alphabetically sort the features by status
      featuresList = features.sort (a, b) ->
        return -1  if a.status < b.status
        return 1  if a.status > b.status
        0

      Session.set "featuresList",featuresList
      return featuresList
    return Session.get "featuresList"

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
