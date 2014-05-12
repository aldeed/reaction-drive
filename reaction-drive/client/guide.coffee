Template.guide.helpers
  fetchDocs: (options) ->
    Meteor.call "fetchDocFromGithub", options.hash.org,options.hash.repo, (error, result) ->
      Session.set "docPage", result.content

  displayDocs: () ->
    Session.get "docPage"

Template.guide.events
  'click .guide-nav-item': (event,template) ->
    Session.set "docPage", ""
    $('li').removeClass("selected")
    $(event.target).parent().addClass("selected")
    Meteor.call "fetchDocFromGithub", $(event.currentTarget).attr('data-org'),$(event.currentTarget).attr('data-repo'), $(event.currentTarget).attr('data-doc'), (error, result) ->
      Session.set "docPage", result.content