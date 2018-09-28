DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS directors;

CREATE TABLE directors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  dob DATE,
  nationality VARCHAR(50)
);

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(50),
  year INTEGER,
  actors TEXT,
  director_id int REFERENCES directors(id)
);

INSERT INTO directors (first_name, last_name, dob, nationality) VALUES ('Steven', 'Spielberg', '1946-12-16', 'American');
INSERT INTO directors (first_name, last_name, dob, nationality) VALUES ('Christopher', 'Nolan', '1970-07-30', 'American');
INSERT INTO directors (first_name, last_name, dob, nationality) VALUES ('Quentin', 'Tarantino', '1963-03-27', 'American');


INSERT INTO movies (title, year, actors, director_id) VALUES ('Armageddon', 1998, 'Bruce Willis, Steve Buschemi, Ben Affleck', 1);
INSERT INTO movies (title, year, actors, director_id) VALUES ('Day After Tomorrow', 1998, 'Jake Gyllenhall, Patrick Stewart, Dennis Quaid', 1);
INSERT INTO movies (title, year, actors, director_id) VALUES ('2012', 2008, 'Woody Harrelson, Arnold Schwarzennaggar, John Cusack', 2);
