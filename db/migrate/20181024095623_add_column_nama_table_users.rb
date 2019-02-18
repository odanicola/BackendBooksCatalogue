class AddColumnNamaTableUsers < ActiveRecord::Migration[5.2]
  def self.up
    add_column :users, :nama, :string, :limit => 255, :null => false, :after => :email
  end

  def self.down
    remove_column :users, :nama
  end
end
