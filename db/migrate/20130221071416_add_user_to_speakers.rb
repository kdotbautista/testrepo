class AddUserToSpeakers < ActiveRecord::Migration
  def change
    add_column :speakers, :user_id, :integer
  end
end
