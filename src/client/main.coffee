Session.setDefault 'viewDate', new Date()

Template.header.date = -> moment(Session.get 'viewDate').format('MMMM DD, YYYY')
Template.header.events
  'click button': (event, template)->
    $button = $(event.target)
    date = moment(Session.get 'viewDate')

    if $button.hasClass 'prev' then Session.set 'viewDate', date.subtract(1, 'day').toDate()
    if $button.hasClass 'next' then Session.set 'viewDate', date.add(1, 'day').toDate()

Template.header.rendered = ->
  $('.datetimepicker').datetimepicker
    defaultDate: Session.get 'viewDate'
    pickTime: false
    format: 'MMMM DD YYYY'

  $('body').on 'change.dp', '.datetimepicker', (event)-> Session.set 'viewDate', event.date.toDate()
