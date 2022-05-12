class RemoveSpeakersUsersId < ActiveRecord::Migration
  def change
    remove_column :speakers, :users_id
  end
end
