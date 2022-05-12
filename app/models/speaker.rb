class Speaker < ActiveRecord::Base
  belongs_to :user
  has_many :proposals

  attr_accessible :user, :bio, :email, :name, :id, :website,  :photo

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "120x120>" }
  validates_attachment_content_type :photo, :content_type => /^image\/(png|gif|jpeg)/

  validates :bio, :email, :name, :photo, :presence => true, :on => :update
  validates :email, :format => {
      :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
      :message => "Must be a valid email address"
  }, :on => :update
end
