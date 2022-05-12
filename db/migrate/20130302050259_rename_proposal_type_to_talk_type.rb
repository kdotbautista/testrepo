class RenameProposalTypeToTalkType < ActiveRecord::Migration
  def change
    rename_column :proposals, :type, :talk_type
  end
end
