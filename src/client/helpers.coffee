Handlebars.registerHelper 'dateAdd', (number)-> moment(new Date()).add(+number, 'days').format('dddd (DD)')
Handlebars.registerHelper 'isLoggedIn', -> Meteor.userId()?
Handlebars.registerHelper 'activeIf', (name)->
  if name is Router.current().route.name
    'active'
  else
    ''
