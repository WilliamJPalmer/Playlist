class SongsController < ApplicationController
  def index
    # scope: newest_first, order(created_at: :desc)

    @songs = Song.all
    @songs.order(created_at: :asc)
  end

  def show
    @song = Song.where(id: params[:id])
    @playlist = Userplaylist.where(song_id: params[:id])
  end



  def create
    @user = User.find(session[:user_id])
    @songs = Song.create(title: params[:title], artist: params[:artist])

    if @songs.valid?
    redirect_to :back
    else
      flash[:errors] = @songs.errors.full_messages
      redirect_to :back
    end
  end
end
