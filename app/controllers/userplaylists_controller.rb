class UserplaylistsController < ApplicationController
  def index
  end

  def create
    @user = User.find(session[:user_id])
    @song = Song.find(params[:song_id])
    @songs = Userplaylist.create(song: @song, user: @user)

    redirect_to :back

  end

  def show
    @songs = Song.all
    @playlist = Userplaylist.all.song
    @songlist = []
    puts @songs
    @playlist.each do |song|
      if Userplaylist.all.where("song_id=?", song.id).length > 0
        @songlist << song
        puts @songlist
        puts'>>>>>>>>>>--------------***************'
      end
  end
end
end
