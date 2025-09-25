class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  def index
    # Whitelist of permitted sort columns
    @allowed_sort_columns = %w[title rating release_date]
    
    # Determine the sort column
    if params[:sort_by].in?(@allowed_sort_columns)
      @sort_by = params[:sort_by]
      session[:sort_by] = @sort_by
    elsif session[:sort_by]
      @sort_by = session[:sort_by]
    else
      @sort_by = 'title' # Default sort column
    end

    # Fetch movies and apply sorting
    @movies = Movie.order(@sort_by)
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movie_url(@movie), notice: "Movie was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @movie.update(movie_params)
      redirect_to movie_url(@movie), notice: "Movie was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_url, notice: "Movie was successfully destroyed."
  end

  private
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :rating, :description, :release_date)
    end
end