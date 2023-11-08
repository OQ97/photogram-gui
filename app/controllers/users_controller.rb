class UsersController < ActionController::Base
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:username => :asc})
    render({ :template => "user_templates/index" })
  end 

  def add 
    u=User.new
    u.username = params.fetch("input_username")
    u.save

    redirect_to("/users/#{u.username}")
  end 

  def show
    url_username = params.fetch("username")
    matching_usernames = User.where({:username => url_username })
    @the_user = matching_usernames.first


    render({ :template => "user_templates/show" })
  end 

  def update 
    url_username = params.fetch("username")
    matching_usernames = User.where({:username => url_username })
    the_user = matching_usernames.first

    the_user.username = params.fetch("input_username")
    the_user.save

    redirect_to("/users/#{the_user.username}")
  end 


end
