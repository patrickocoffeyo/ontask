Meteor.startup ->
  Tasks.allow
    insert: (userId, order)-> true
    update: (userId, order)-> true
    remove: (userId, order)-> true

Meteor.publish 'tasks-day', (date)->
  start = end = date

  start.setHours 0,0,0,0
  end.setHours 23,59,59,999

  Tasks.find { date: { $gte: start, $lt: end } }
