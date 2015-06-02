class HomeController < ApplicationController
  def index
    send_data Datapoint.toCSV, filename: "data.csv"
  end
end
