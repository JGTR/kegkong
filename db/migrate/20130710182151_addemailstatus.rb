class Addemailstatus < ActiveRecord::Migration
  
  def up
  	change_table(:kegs) do |t|
  		t.column :email_status, :boolean
  	end 
  end

  def down
  	change_table(:kegs) do |t|
  		t.remove :email_status
  	end
  end

end
