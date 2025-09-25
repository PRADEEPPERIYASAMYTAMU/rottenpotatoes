class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  def index
    # Whitelist of permitted sort columns
    allowed_sort_columns = %w[title rating release_date]
    
    # Determine the sort column from params or session
    @sort_by = if params[:sort_by].in?(allowed_sort_columns)
      session[:sort_by] = params[:sort_by]
    else
      session[:sort_by] || 'title'
    end
  
    allowed_directions = %w[asc desc]
  
    @direction = if params[:direction].in?(allowed_directions)
      session[:direction] = params[:direction]
    else
      session[:direction] || 'asc'
    end
    @pagy, @movies = pagy(Movie.order(@sort_by => @direction))
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