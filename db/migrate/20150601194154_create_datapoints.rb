class CreateDatapoints < ActiveRecord::Migration
  def change
    create_table :datapoints do |t|
      t.datetime :date
      t.string :sensor
      t.string :value

      t.timestamps null: false
    end
  end
end
