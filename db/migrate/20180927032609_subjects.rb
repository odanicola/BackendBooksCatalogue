class Subjects < ActiveRecord::Migration[5.2]
  def self.up
    create_table :subjects do |t|
      t.column :nama, :string
    end
  end

  def self.down
    drop_table :subjects
  end
end
