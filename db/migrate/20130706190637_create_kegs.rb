class CreateKegs < ActiveRecord::Migration
  def up
    create_table :kegs do |t|
      t.string :beer_type
      t.integer :max_volume
      t.timestamps
    end
  end

  def down
    drop_table :kegs
  end
end
