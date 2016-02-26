$(document).ready ->
  $('#users-content')[0].style.display = 'none'

  $('.btn-sidebar').click ->
    $('body').toggleClass 'showSidebar'
    return

  clickLink = (type) ->
    $.ajax
      url: '/users',
      type: 'GET',
      dataType: 'JSON',
      async: false,
      data: { users: type }
      success: (response) ->
        return response
      error: ->
        alert 'something went wrong'
        return []

  editUserTitle = (title) ->
    $("#users-title").empty()
    $("#users-title").append(title + " users")

  buildUserTable = (users) ->
    $('#users-list').empty()
    users = JSON.parse(users)
    users.forEach (u) ->
      $('#users-list').append("<li>" + u.email + "</li>")

  $('#home-page').click ->
    $('#users-content')[0].style.display = 'none'
    $('#home-content')[0].style.display = ''

  $('#admin-users').click ->
    $('#home-content')[0].style.display = 'none'
    $('#users-content')[0].style.display = ''
    editUserTitle('Admin')
    response = clickLink('admin')
    users = response.responseText
    buildUserTable(users)
    return

  $('#inactive-users').click ->
    $('#home-content')[0].style.display = 'none'
    $('#users-content')[0].style.display = ''
    editUserTitle('Inactive')
    response = clickLink('all')
    users = response.responseText
    buildUserTable(users)
    return

  $('#all-users').click ->
    $('#home-content')[0].style.display = 'none'
    $('#users-content')[0].style.display = ''
    editUserTitle('All')
    response = clickLink('all')
    users = response.responseText
    buildUserTable(users)
    return

  $('#sample-users').click ->
    $('#home-content')[0].style.display = 'none'
    $('#users-content')[0].style.display = ''
    editUserTitle('Sample')
    response = clickLink('sample')
    users = response.responseText
    buildUserTable(users)
    return

