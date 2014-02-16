channel = undefined
Session.setDefault 'viewDate', new Date()

Router.map ->
  this.route 'dashboard',
    path: '/'
    template: 'dashboard'
    waitOn: -> channel = Meteor.subscribe 'tasks-day', Session.get 'viewDate'
    unload: -> do channel.stop
    data:
      tasks: -> Tasks.find()

Template.header.date = -> moment(Session.get 'viewDate').format('MMMM DD, YYYY')
Template.header.events
  'click button': (event, template)->
    $button = $(event.target)
    date = moment(Session.get 'viewDate')

    if $button.hasClass 'prev' then Session.set 'viewDate', date.subtract(1, 'day').toDate()
    if $button.hasClass 'next' then Session.set 'viewDate', date.add(1, 'day').toDate()

Template.dashboard.events
  'click .check i': (event, template)->
    $i = $(event.target)
    id = $i.closest('tr').data('id')

    if $i.hasClass('fa-check-square-o') then completed = false else completed = true
    Tasks.update { _id: id }, { $set: { completed: completed } }

  'click i.fa-trash-o': (event, template)->
    Tasks.remove { _id: $(event.target).closest('tr').data('id') }

