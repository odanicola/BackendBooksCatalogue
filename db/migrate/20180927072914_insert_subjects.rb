class InsertSubjects < ActiveRecord::Migration[5.2]
  def self.up
    add_column :subjects, :description, :text
    execute <<-SQL
      INSERT INTO subjects (`nama`,`description`) VALUES('Chemistry','Blah');
    SQL
  end

  def self.down
    execute <<-SQL
      DELETE FROM subjects WHERE `nama` = 'Chemistry';
    SQL
    remove_column :subjects, :description, :text
  end
end
