class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def home
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.photo.attach(params[:photo])
    if @movie.save
      redirect_to movies_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

end
