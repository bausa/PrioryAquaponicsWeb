## Download
run `git clone https://github.com/samuelb2/PrioryAquaponicsWeb.git && cd PrioryAquapoinicsWeb`

## Data Access
Visit the homepage of the application and a CSV will be downloaded
To log data make a GET request to /log with a parameter called sensor and one named value

## Example API request
Type this into terminal to test the API
```
curl http://localhost:3000/log?sensor=temp1&value=23
```

## Code structure
```
  -app
    -controllers
      -data_input_controllers.rb (handles data logging and API requests)
      -home_controller.rb (handles home csv rendering)
    -models
      -datapoint.rb (is the class that represents a datapoint and has methods for CSV generation)
``` 
## Installing Ruby and Rails
You can do it all in one line by just running:
```
curl -sSL https://get.rvm.io | bash -s stable --rails
```
    
## Querying data
To query data in a controller, you can run queries on the data point class
Some examples are `Datapoint.all`
will return an array of datapoints
`Datapoint.where(:sensor => "temp1")` will return the datapoints that have a sensor with the name "temp1"
Google "ActiveRecord query rails" for more information on different queries

## Database Structure
The database is an sqlite3 database in dev (essentially just a file)
In production it runs a database called postgresql which is far more complicated and takes some time to setup on your local machine.  It will automatically switch.  Feel free to research postgres more and try to get it running.

## Changing routes
All the routes are defined in config/routes.rb.  You can change the URLs you use to request different actions in there.  You also can embed parameters in the urls by writing ":paramname" in the URL.  For example, to have the sensor name in the URL you could replace `get 'log', to: "data_input#logData"` with `get 'log/:sensor', to: "data_input#logData"`.

## Dependancies
You can view all the dependancies in a file called Gemfile.
To install everything, just run `gem install`

## Server setup
* Ensure you have ruby >= 2.0.0 and rails >= 4.0.0
* Run `gem install` to download all dependencies
* To deploy the code, setup the Heroku toolbox (http://heroku.com), then run `heroku create`.
* You can then use git to push the code to the "heroku" remote (see below)
* Finally, to ensure the production database is populated, run `heroku run rake db:migrate`

## Local setup
* Ensure you have ruby >= 2.0.0 and rails >= 4.0.0
* Run `gem install` to download all dependencies
* run `rake db:migrate` to migrate the db migrations
* Run `rails server`.

## Push code to git repository
Git has a lot of functionality; however, here I will only detail the bare necessities to push code to the server.
* Open a command prompt and navigate to the code
* Run `git add .` to add every file that has changed to the stage (things to push to the server)
* Run `git commit -m "put a message here"` to essentially tag the changes you made
* Run `git push heroku master` to push the changes up to heroku (the server)

## TODO
* Add in data visualization
* Write unit tests
* Handle invalid inputs on logging
* Write base for data caching for calculations (essentially setup a cache using something like redis so the data is stored in memory for fast retrieval)
