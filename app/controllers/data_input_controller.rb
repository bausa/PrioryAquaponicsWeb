class DataInputController < ApplicationController
  def logData
    dp = Datapoint.new
    dp.date = DateTime.now
    dp.sensor = params[:sensor]
    dp.value = params[:value]
    dp.save
    
    render :text => "Ok"
  end
end