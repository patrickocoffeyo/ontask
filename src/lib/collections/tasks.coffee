this.Tasks = new Meteor.Collection2 'tasks',
  schema:
    title:
      type: String
      label: "Title"
    date:
      type: Date
      label: "Date"
    delta:
      type: Number
      label: "Delta"
  transform: (task)->
    task.dateFormatted = moment(task.date).format('MMMM DD, YYYY')
    return task
