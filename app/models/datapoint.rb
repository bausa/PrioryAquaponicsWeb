class Datapoint < ActiveRecord::Base
  def self.toCSV
    out = "date, sensor name, value\n"
    Datapoint.all.each do |dp|
      out << "#{dp.date},#{dp.sensor},#{dp.value}\n"
    end
    
    out
  end
end
