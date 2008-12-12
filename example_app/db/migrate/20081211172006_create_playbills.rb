class CreatePlaybills < ActiveRecord::Migration
  def self.up
    create_table :playbills, :force => true do |t|
      t.timestamps
      t.string :name
      t.string :title
      t.text :description
      t.string :author
      t.string :version
      t.string :size
    end
  end

  def self.down
    drop_table :playbills
  end
end
