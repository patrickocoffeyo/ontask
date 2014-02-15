Router.configure
  layoutTemplate: 'layoutMain'

Router.before ->
  unless Meteor.userId()
    this.redirect 'userUnauthorized'
    do this.stop
, {except: ['userUnauthorized']}
