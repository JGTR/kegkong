class Changemaxvolinkegs < ActiveRecord::Migration
  def up
	change_column(:kegs, :max_volume, :float)
  end

  def down
	change_column(:kegs, :max_volume, :integer)
  end
end
