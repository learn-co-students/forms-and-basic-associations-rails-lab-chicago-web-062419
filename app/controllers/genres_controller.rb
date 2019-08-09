class GenresController < ApplicationController
    before_action :find_genre, only: [:show, :edit, :update, :destroy]


    def index
        @genres = Genre.all
    end

    def new
        @genre.new
    end

    def create
        @genre.new(genre_params)
    end

    def show
        #before action
    end

    def edit
        #before action
    end

    def update
        #before action
        @genre.update(genre_params)

        if @genre.save
            redirect_to @genre
        else
            render :edit
        end
    end

    def destroy
        #before action
        @genre.destroy
        flash[:notice] = "Genre deleted."
        redirect_to genres_path
    end

    private

    def genre_params
        params.require(:genre).permit(:name)
    end

end
