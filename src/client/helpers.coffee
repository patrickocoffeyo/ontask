Handlebars.registerHelper 'isLoggedIn', -> Meteor.userId()?
Handlebars.registerHelper 'viewDate', -> Session.get 'viewDate'
Handlebars.registerHelper 'viewDateFormatted', -> moment(Session.get 'viewDate').format('MMMM DD YYYY')
Handlebars.registerHelper 'activeIf', (name)->
  if name is Router.current().route.name
    'active'
  else
    ''
