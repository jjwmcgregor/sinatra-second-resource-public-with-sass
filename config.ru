require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './models/Director.rb'
require_relative './models/Movie.rb'
require_relative './controllers/static_controller.rb'
require_relative './controllers/movies_controller.rb'
require_relative './controllers/directors_controller.rb'

use Rack::Reloader
use Rack::MethodOverride

run Rack::Cascade.new([
  StaticController,
  MoviesController,
  DirectorsController
])
