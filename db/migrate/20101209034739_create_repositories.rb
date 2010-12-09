class CreateRepositories < ActiveRecord::Migration
  def self.up
    create_table :repositories do |t|
      t.string :name
      t.string :url
      t.string :regex
      t.datetime :last_checked

      t.timestamps
    end
  end

  def self.down
    drop_table :repositories
  end
end
