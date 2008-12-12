class <%= migration_name %> < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name %>, :force => true do |t|
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
    drop_table :<%= table_name %>
  end
end