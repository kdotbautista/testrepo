class AddProposalPriorPresentation < ActiveRecord::Migration
  def change
    add_column :proposals, :prior_presentation, :text
  end
end