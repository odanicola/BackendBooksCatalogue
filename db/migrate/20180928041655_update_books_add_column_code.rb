class UpdateBooksAddColumnCode < ActiveRecord::Migration[5.2]
  def self.up
    add_column :books, :code, :string, :limit => 20, :null => false, :after => :id
  end

  def self.down
    remove_column :books, :code
  end
end
