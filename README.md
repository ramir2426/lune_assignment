# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things that application have:
##

1. Show an overview of all movies in your application

2. Have a search form to search for an actor

3. Ability to sort the overview by average stars (rating) in an efficient way
##

* Ruby version
2.7.3

* Rails 7.0.8.4

* Database postgres
  
* run these below commands on termainal inside the repo directory
##

    bundle install
    rails db:create db:migrate
    rake csv_importer:movies  
    rake csv_importer:reviews
    rspec spec
    rails s
##
Goto the browser and hit http://localhost:3000/. check the application functionality 

* ...
