Router.map ->
  this.route 'userUnauthorized',
    before: ->
      if Meteor.userId()?
        this.redirect 'dashboard'
        do this.stop
    path: '/login'
    template: 'userUnauthorized'
