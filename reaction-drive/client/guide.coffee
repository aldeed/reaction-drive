Template.guide.helpers
  fetchDocs: (options) ->
    Meteor.call "fetchDocFromGithub", options.hash.org,options.hash.repo, options.hash.doc, (error, result) ->
      Session.set "docPage", result.content unless error

  displayDocs: () ->
    Session.get "docPage"

  isFirst: () ->
    $('ul .selected').is(":first-child")
  isLast: () ->
    $('ul .selected').is(":last-child")

Template.guide.events
  'click .guide-nav-item,.guide-sub-nav-item': (event,template) ->
    Session.set "docPage", ""
    $('li').removeClass("selected")
    $(event.target).parent().addClass("selected")
    Meteor.call "fetchDocFromGithub", $(event.currentTarget).attr('data-org'),$(event.currentTarget).attr('data-repo'), $(event.currentTarget).attr('data-doc'), (error, result) ->
      Session.set "docPage", result.content unless error

  'click #next-doc': (event,template) ->
    nextDoc = $('.selected').next('li')
    if nextDoc.length > 0
      doc = nextDoc.children().attr('data-doc')
      org = nextDoc.children().attr('data-org')
      repo = nextDoc.children().attr('data-repo')
      $('li').removeClass("selected")
      nextDoc.addClass("selected")
      Meteor.call "fetchDocFromGithub", org , repo, doc, (error, result) ->
        Session.set "docPage", result.content unless error
    return

  'click #prev-doc': (event,template) ->
    nextDoc = $('.selected').prev('li')
    if nextDoc.length > 0
      doc = nextDoc.children().attr('data-doc')
      org = nextDoc.children().attr('data-org')
      repo = nextDoc.children().attr('data-repo')
      $('li').removeClass("selected")
      nextDoc.addClass("selected")
      Meteor.call "fetchDocFromGithub", org , repo, doc, (error, result) ->
        Session.set "docPage", result.content unless error
    return

