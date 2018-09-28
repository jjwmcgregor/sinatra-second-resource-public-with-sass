class Movie

  attr_accessor :id, :title, :year, :actors, :director_id, :director

  def self.open_conection
    conn = PG.connect( dbname: 'movies' )
  end

  # In the controller, we'll call the save method like Movie.save, so we can use self. to access the properties of the Movie (eg title, year, actors)
  def save
    conn = Movie.open_conection

    # IF the class instance that we're running the save method on does NOT have an ID then create, else update
    if !self.id
      sql = "INSERT INTO movies (title, year, actors) VALUES ('#{self.title}', #{self.year}, '#{self.actors}')"
    else
      sql = "UPDATE movies SET title='#{self.title}', year=#{self.year},actors='#{self.actors}' WHERE id='#{self.id}'"
    end

    conn.exec(sql)

  end

  def self.all

    conn = self.open_conection
    sql = "SELECT * FROM movies ORDER BY id"
    results = conn.exec(sql)

    movies = results.map do |movie|
      self.hydrate movie
    end
    puts movies
    movies

  end

  def self.all_with_director
    conn = self.open_conection
    sql = "SELECT movies.id, movies.title, movies.year, movies.actors, movies.director_id, directors.id, directors.first_name, directors.last_name FROM movies JOIN directors ON movies.director_id = directors.id"
    results = conn.exec(sql)

    movies = results.map do |movie|
      self.hydrate movie
    end

    movies
  end

  def self.find id

    conn = self.open_conection
    sql = "SELECT * FROM movies WHERE id=#{id}"

    results = conn.exec(sql)

    movie = self.hydrate results[0]

    movie

  end

  def self.find_with_director id

    conn = self.open_conection
    # sql = "SELECT * FROM movies WHERE id=#{id}"

    sql = "SELECT movies.id, movies.title, movies.year, movies.actors, movies.director_id, directors.id, directors.first_name, directors.last_name FROM directors JOIN movies ON movies.director_id = directors.id WHERE directors.id=#{id}"

    results = conn.exec(sql)

    movie = self.hydrate results[0]

    movie

  end

  def self.destroy id
    conn = self.open_conection
    sql = "DELETE FROM movies WHERE id=#{id}"
    conn.exec(sql)
  end

  def self.hydrate movie_data
    movie = Movie.new

    movie.id = movie_data['id']
    movie.title = movie_data['title']
    movie.year = movie_data['year']
    movie.actors = movie_data['actors']
    movie.director_id = movie_data['director_id']
    movie.director = "#{movie_data['first_name']} #{movie_data['last_name']}"

    movie

  end

end
