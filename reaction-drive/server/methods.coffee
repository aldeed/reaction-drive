Meteor.methods
  fetchDocFromGithub: (org,repo,doc) ->
    unless doc then doc = "README.md"
    Meteor.http.get "http://raw.github.com/" + org + "/" + repo + "/master/" + doc