# Sinatra Fullstack

### This code is the completed classwork over the last few days, building up a Sinatra application with Models, Views and Controllers. It also has a second resource (Directors) that has some extra methods in the Models so we can join the two tables together, as well as a public folder for our images, javascript, CSS and SCSS.

#### How to use
* clone this directory into a location of your choice and `cd` into it
* once inside, you will need to seed the database. This app uses a database called *movies* so you will either need to create one called the same or you will need to change the dbname in the Models
* to seed it, run `psql -d movies -f seed.sql`

#### SASS
Sass (Syntactically Awesome Style Sheets) is like CSS with superpowers, and it's dead easy to get up and running with Ruby.

First make sure SASS is installed with `gem install sass`

To run SASS in this project, run the following command:

`sass --watch public/scss/main.scss:public/css/main.css`

What this does is "watches" the *main.scss* file for changes then automatically updates the *main.css* file so the browser can read it.

Here are some resources to get you familiar:
* [Sass lang](https://sass-lang.com/)
* [Traversy Video](https://www.youtube.com/watch?v=rmXVmfx3rNo&t=68s) (he uses javascript to run it so skip to 15:00mins)

Any questions, message me on Teams
