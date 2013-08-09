class CreateMeasurements < ActiveRecord::Migration
  def up
    create_table :measurements do |t|
      t.integer :pulses
      t.float   :change_in_volume # have to standardize units 
      t.belongs_to :keg
      t.timestamps
    end
  end

  def down
    drop_table :measurements
  end
end
