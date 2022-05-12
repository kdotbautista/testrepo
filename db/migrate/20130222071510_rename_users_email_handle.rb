class RenameUsersEmailHandle < ActiveRecord::Migration
  def change
    remove_index :users, :name => "index_users_on_email"
    rename_column :users, :email, :handle
    add_index :users, [:provider, :handle], {:unique => true}
  end
end
