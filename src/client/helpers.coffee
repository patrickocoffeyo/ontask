Handlebars.registerHelper 'dateAddFormatted', (number)-> moment(new Date()).add(+number, 'days').format('dddd (DD)')
Handlebars.registerHelper 'dateAdd', (number)-> moment(new Date()).add(+number, 'days').format('YYYY-MM-DD')
Handlebars.registerHelper 'isLoggedIn', -> Meteor.userId()?
Handlebars.registerHelper 'activeIf', (name)->
  if name is Router.current().route.name
    'active'
  else
    ''
