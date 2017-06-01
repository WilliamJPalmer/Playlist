class UsersController < ApplicationController
  def index

  end

  def show
    @user = User.where(id: params[:id])
    @playlist = Userplaylist.all

    # @userslist = []
    # @playlist.each do |user|
    # if Userplaylist.all.where("user_id=?", user.id).length>0
    #   @userlist << user
    # end
  end

  def login
    @users = User.find_by_email(params[:email])

    if @users && @users.authenticate(params[:password])
      session[:user_id] = @users.id
      redirect_to "/songs/"
    else
      flash[:errors] = ["Invalid Login Information"]
      redirect_to :back
    end
  end

  def create
    @users = User.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    password: params[:password]
    )

    if @users.valid?
      session[:user_id] = @users.id
      redirect_to '/songs/'
    else
      flash[:errors] = @users.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end
end
