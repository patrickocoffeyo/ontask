channel = undefined

Session.setDefault 'viewDate', new Date()
Router.map ->
  this.route 'home',
    path: '/'
    template: 'dashboard'

Template.header.date = -> moment(Session.get 'viewDate').format('MMMM DD, YYYY')
Template.header.events
  'click button': (event, template)->
    $button = $(event.target)
    date = moment(Session.get 'viewDate')

    if $button.hasClass 'prev' then Session.set 'viewDate', date.subtract(1, 'day').toDate()
    if $button.hasClass 'next' then Session.set 'viewDate', date.add(1, 'day').toDate()

