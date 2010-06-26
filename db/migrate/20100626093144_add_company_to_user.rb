class AddCompanyToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :company, :text
  end

  def self.down
     remove_column :users, :company
  end
end
