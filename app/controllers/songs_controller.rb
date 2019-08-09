require 'pry'

class SongsController < ApplicationController
    before_action :find_song, only:[:show, :edit, :update, :destroy]
    
    def index
        @songs = Song.all
    end

    def show
        # before action
    end

    def new
        @song = Song.new
        @genres = Genre.all
    end

    def create
        @song = Song.new(song_params)

        if @song.save

            redirect_to @song
        else
            render :new
        end
    end

    def edit
        #before action
    end

    def update
        #before action

        @song.update(song_params)

        if @song.save
            redirect_to @song
        else
            render :edit
        end
    end

    def destroy
        #before action
        @song.destroy
        flash[:notice] = "Song deleted."
        redirect_to songs_path
    end

    private

    def song_params
        params.require(:song).permit(:title, :artist_name, :genre_id, note_contents: [])
    end

    def find_song
        @song = Song.find_by(id: params[:id])
    end
end

