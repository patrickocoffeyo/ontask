Router.map ->
  this.route 'addTask',
    path: '/task/add'
    template: 'taskForm'

tasksSchema = new AutoForm Tasks
tasksSchema.hooks
  after:
    insert: (err, res, template)->
      $('input[name="date"]').val $('#taskDateSelect').val()

  formToDoc: (doc)->
    doc.user = Meteor.userId()
    doc.date = Session.get 'viewDate'
    doc.completed = false
    return doc
Template.taskForm.tasksSchema = tasksSchema
