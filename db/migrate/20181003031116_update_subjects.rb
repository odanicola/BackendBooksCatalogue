class UpdateSubjects < ActiveRecord::Migration[5.2]
  def self.up
    change_table :subjects do |t|
      t.column :status, "enum('0','1')", :default => '0'
      t.timestamps
    end
  end

  def self.down
    remove_column :subjects, :created_at
    remove_column :subjects, :updated_at
  end
end
