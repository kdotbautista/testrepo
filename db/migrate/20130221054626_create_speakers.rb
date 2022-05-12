class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.references :users
      t.integer :id
      t.string :name
      t.string :email
      t.string :website
      t.text :bio

      t.timestamps
    end
  end
end
