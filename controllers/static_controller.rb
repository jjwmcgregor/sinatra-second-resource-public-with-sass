class StaticController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # setting the root as the parent directory of the current directory
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  get '/' do
    erb :'static/landing'
  end

end
