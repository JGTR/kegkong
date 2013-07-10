class Addemailstatus < ActiveRecord::Migration
  def up
  	add_column :kegs, :email_status :boolean
  end

  def down
  	remove_column :kegs, :email_status
  end
end
