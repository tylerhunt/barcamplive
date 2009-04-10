class CreateTalks < ActiveRecord::Migration
  def self.up
    create_table :talks do |t|
      t.integer :venue_id
      t.string :speaker
      t.string :topic
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end

  def self.down
    drop_table :talks
  end
end
