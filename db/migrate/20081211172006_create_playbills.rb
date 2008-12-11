class CreatePlaybills < ActiveRecord::Migration
  def self.up
    create_table :playbills, :force => true do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :playbills
  end
end
