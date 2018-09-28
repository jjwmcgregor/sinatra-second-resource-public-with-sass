class Director

  attr_accessor :id, :first_name, :last_name, :dob, :nationality, :movies

  def self.open_connection
    conn = PG.connect( dbname: 'movies')
  end

  def save
    conn = Director.open_connection

    if !self.id
      sql = "INSERT INTO directors (first_name, last_name, dob, nationality) VALUES ('#{self.first_name}', '#{self.last_name}', '#{self.dob}', '#{self.nationality}')"
    else
      sql = "UPDATE directors SET first_name='#{self.first_name}', last_name='#{self.last_name}', dob='#{self.dob}', nationality='#{self.nationality}' WHERE id=#{self.id}"
    end

    conn.exec(sql)
  end

  def self.all

    conn = self.open_connection
    sql = "SELECT * FROM directors ORDER BY id"
    results = conn.exec(sql)

    directors = results.map do |director|
      self.hydrate director
    end

    directors

  end

  def self.find id
    conn = self.open_connection
    sql = "SELECT * FROM directors WHERE id=#{id}"
    results = conn.exec(sql)

    director = self.hydrate results[0]

    director
  end

  def self.find_with_movies id
    conn = self.open_connection
    sql = "SELECT movies.id, movies.title, movies.year, movies.actors, movies.director_id, directors.id, directors.first_name, directors.last_name FROM directors JOIN movies ON movies.director_id = director_id WHERE directors.id=#{id}"
    results = conn.exec(sql)

    director = self.hydrate results[0]

    director
  end

  def self.destroy id
    conn = self.open_connection
    sql = "DELETE FROM directors WHERE id=#{id}"
    conn.exec(sql)
  end

  def self.hydrate director_data
    director = Director.new

    director.id = director_data['id']
    director.first_name = director_data['first_name']
    director.last_name = director_data['last_name']
    director.dob = director_data['dob']
    director.nationality = director_data['nationality']
    director.movies = [director_data['title']]

    director
  end

end
