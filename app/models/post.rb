# encoding: utf-8

# coding: utf-8
class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::SoftDelete 
  include Mongoid::CounterCache
  include Mongoid::BaseModel
  
  STATE = {
    :draft => 0,
    :normal => 1
  }
  
  field :title  
  field :body
  field :body_html
  field :state, :type => Integer, :default => STATE[:normal]
  field :tags, :type => Array, :default => []
  field :comments_count, :type => Integer, :default => 0
  field :read_count, :type => Integer, :default => 0
  field :remote_id , :type => Integer


  belongs_to :category
  # belongs_to :user
  counter_cache :name => :category, :inverse_of => :posts
    
  #index
  index({tags: 1})
  index({category_id: 1})
  index({state: 1})

  # counter :hits, :default => 0
  
  attr_accessible :title, :body, :tag_list,:category_id,:created_at
  attr_accessor :tag_list
  
  validates_presence_of :title,:category_id

  # scopes
  scope :last_actived, desc("updated_at").desc("created_at")
  scope :fields_for_list, without(:body,:body_html)
  
  scope :normal, where(:state => STATE[:normal])
  scope :by_tag, Proc.new { |t| where(:tags => t) }
  
  
  scope :by_month,  lambda {|start, finish| 
    where(:created_at => {'$gte' => start,'$lt' => finish}) if start && finish
  }

  
  before_save :split_tags
  def split_tags
    if !self.tag_list.blank? and self.tags.blank?
      self.tags = self.tag_list.split(/,|，/).collect { |tag| tag.strip }.uniq
    end
  end
  
  before_save :markdown_for_body_html
  def markdown_for_body_html
    return true if not self.body_changed?

    self.body_html = MarkdownConverter.convert(self.body)
  rescue => e
    Rails.logger.error("markdown_for_body_html failed: #{e}")
  end
  
  def hits_incr
    self.update_attribute(:read_count,self.read_count + 1) 
  end
  
  # 给下拉框用
  def self.state_collection
    STATE.collect { |s| [s[0], s[1]]}
  end
  
end
