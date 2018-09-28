class MoviesController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # setting the root as the parent directory of the current directory
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # INDEX
  get '/movies' do
    @title = "Index Page"
    @movies = Movie.all_with_director

    erb :'movies/index'
  end
  # NEW
  get '/movies/new' do
    erb :'movies/new'
  end
  # SHOW
  get '/movies/:id' do
    id = params[:id].to_i
    # @movie = Movie.find id
    @movie = Movie.find_with_director id

    erb :'movies/show'
  end
  # CREATE
  post '/movies' do

    movie = Movie.new

    movie.title = params[:title]
    movie.year = params[:year]
    movie.actors = params[:actors]

    movie.save

    redirect '/movies'

  end
  # UPDATE
  put '/movies/:id' do
    id = params[:id].to_i

    movie = Movie.find id

    movie.title = params[:title]
    movie.year = params[:year]
    movie.actors = params[:actors]

    movie.save

    redirect '/movies'

  end
  # DELETE
  delete '/movies/:id' do
    id = params[:id].to_i
    Movie.destroy id
    redirect '/movies'
  end
  # EDIT
  get '/movies/:id/edit' do
    id = params[:id].to_i
    @movie = Movie.find id

    erb :'movies/edit'
  end

end
