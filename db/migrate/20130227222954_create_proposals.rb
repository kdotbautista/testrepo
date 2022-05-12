class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :title
      t.text :short_abstract
      t.text :proposal
      t.string :type
      t.text :special_requirements
      t.references :speaker

      t.timestamps
    end
    add_index :proposals, :speaker_id
  end
end
