class AddHrstatusToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :hr_status, :boolean,:default=>false
    add_column :users, :language_id, :integer
    execute "alter table users add constraint fk_language_id
        foreign key (language_id) references languages(id)"
  end

  def self.down
     remove_column :users, :hr_status
     remove_column :users, :language_id
  end
end
