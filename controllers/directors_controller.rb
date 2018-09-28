class DirectorsController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # setting the root as the parent directory of the current directory
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  # INDEX
  get '/directors' do
    @title = "Index Page"
    @directors = Director.all

    erb :'directors/index'
  end
  # NEW
  get '/directors/new' do
    erb :'directors/new'
  end
  # SHOW
  get '/directors/:id' do
    id = params[:id].to_i
    @director = Director.find id

    erb :'directors/show'
  end
  # CREATE
  post '/directors' do

    director = Director.new

    director.first_name = params[:first_name]
    director.last_name = params[:last_name]
    director.dob = params[:dob]
    director.nationality = params[:nationality]

    director.save

    redirect '/directors'

  end
  # UPDATE
  put '/directors/:id' do
    id = params[:id].to_i

    director = Director.find id

    director.first_name = params[:first_name]
    director.last_name = params[:last_name]
    director.dob = params[:dob]
    director.nationality = params[:nationality]

    director.save

    redirect '/directors'

  end
  # DELETE
  delete '/directors/:id' do
    id = params[:id].to_i
    Director.destroy id
    redirect '/directors'
  end
  # EDIT
  get '/directors/:id/edit' do
    id = params[:id].to_i
    @director = Director.find id

    erb :'directors/edit'
  end

end
