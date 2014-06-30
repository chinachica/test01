class Post < ActiveRecord::Base
  attr_accessible :content, :title, :category_id

  has_many :comments
  has_many :categories

  validates :title, :presence => true
  validates :content, :presence => true,
  						:length => { :minimum => 5 }

  default_scope :order => 'created_at DESC'
  paginates_per 5

  scope :content_or_title_matches, lambda {|q|  
    where 'content like :q or title like :q', :q => "%#{q}%"  
  } 

  default_scope :order => 'created_at ASC'
end
