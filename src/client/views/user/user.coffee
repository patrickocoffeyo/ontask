Router.map ->
  this.route 'userUnauthorized',
    before: ->
      if Meteor.userId()?
        this.redirect 'dashboard'
        do this.stop
    path: '/login'
    template: 'userUnauthorized'

  this.route 'account',
    path: '/account'
    template: 'account'

Template.account.events
  'click button.logout': (event, template)-> Meteor.logout()
  'click button.cancel': (event, template)->
    $('#cancelAccount').modal('hide')
    Meteor.call 'cancelAccount', (err, res)->
      unless err
        FlashMessages.sendSuccess 'Your account has been completely obliterated. :)'
        Meteor.logout()
