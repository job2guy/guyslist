class AddUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :qualification, :string , :limit => 50
    add_column :users, :occupation, :string , :limit => 50
  end

  def self.down
  end
end
