channel = undefined

Router.map ->
  this.route 'home',
    path: '/'
    template: 'dashboard'
    data:
      today: moment(new Date()).format('MMMM DD, YYYY')
