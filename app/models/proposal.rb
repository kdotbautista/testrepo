class Proposal < ActiveRecord::Base
  belongs_to :speaker
  attr_accessible :proposal, :short_abstract, :special_requirements, :title, :talk_type, :prior_presentation

  validates :title, :short_abstract, :proposal, :talk_type, :presence => true
  validates_length_of :title, :maximum => 80, :too_long => "must be be no more than 80 characters long."
  validates_length_of :short_abstract, :maximum => 250, :too_long => "must be no more than 250 words.",
                      :tokenizer => lambda { |str| str.scan(/\w+/) }
  validates_length_of :proposal, :maximum => 750, :too_long => "must be no more than 750 words.",
                      :tokenizer => lambda { |str| str.scan(/\w+/) }
  validates_length_of :special_requirements, :maximum => 150, :too_long => "must be no more than 150 words.",
                      :tokenizer => lambda { |str| str.scan(/\w+/) }
end
